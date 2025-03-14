import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../constants.dart';
import 'dart:convert';
import '../../utils/app_database.dart';
import '../../utils/app_database_shared.dart' as database;

// QUI AVVIENE TUTTA LA GESTIONE DELLA LOGICA DELLA PAGINA DEL LABORATORIO, IL GROSSO DEL GIOCO

class LaboratoryModel with ChangeNotifier {

  bool _isLoading = true;
  String _partitaData = "Dati non trovati";
  String _numeroPartita = "0";
  List<database.Material> _materials = [];
  List<database.Material> _newMaterials = [];
  final List<database.Material> _lastMaterials = [];
  final List<database.Material> _materialsToCombine = [];
  List<database.Category> _categories = [];
  List<database.Quest> _quests = [];
  int _contatorePenalita = 0;
  Map<String, dynamic> _partitaMap = {"level":1,"like":0,"experience":0,"credit":0,"combination_done_list":{},"unuseful_combinations":0,"quest_done_list":{},"quest_active_list":[],"material_discovered_list":[] ,"last_save":"18:20:00 - 05/12/91"};

  // listeners
  Map<String, dynamic> get partitaMap => _partitaMap;
  List<database.Material> get materials => _materials;
  List<database.Material> get newMaterials => _newMaterials;
  List<database.Material> get lastMaterials => _lastMaterials;
  List<database.Category> get categories {
    final latestCategory = database.Category(id: -1, name: nomeCategoriaUltimiMateriali, purchasable: 0);
    return [latestCategory, ..._categories];
  }
  List<database.Quest> get quests => _quests;
  bool get isLoading => _isLoading;
  List<database.Material> get materialsToCombine => _materialsToCombine;

  Future<void> loadMaterialsByCategory(dynamic idCategoria) async {
    final db = await openDatabase();

    final idCategoriaInt = idCategoria as int;
    _materials = await db.getMaterialsByCategory(idCategoriaInt, _partitaMap["material_discovered_list"]);
  
    notifyListeners();
  }

  Future<List<dynamic>> getCompletedQuests(List<dynamic> activeQuestIds) async {
    final db = await openDatabase();
    final completedQuests = <dynamic>[];

    for (var questId in activeQuestIds) {
      final query = db.selectOnly(db.quests)
      ..addColumns([db.quests.name])
      ..where(db.quests.id.equals(questId));

      final quest = await query.map((row) => {
        'name': row.read(db.quests.name),
      }).getSingleOrNull();

      if (quest != null) {
        bool isCompleted = true;

        // Controlla se ci sono materiali richiesti per completare la quest
        final requiredMaterials = await (db.select(db.questMaterials)..where((qm) => qm.questId.equals(questId))).get();

        for (var qm in requiredMaterials) {
          if (!(_partitaMap["material_discovered_list"].contains(qm.materialId))) {
            isCompleted = false;
            break;
          }
        }

        if (isCompleted) {
          completedQuests.add(questId);
        }
      }
    }

    return completedQuests;
  }

  Future<int> getNextLevelIfEligible(int currentLevelId, int playerExperience) async {
    final db = await openDatabase();

    // Ottieni il livello attuale
    final currentLevel = await (db.select(db.levels)..where((l) => l.id.equals(currentLevelId))).getSingleOrNull();
    if (currentLevel == null) return currentLevelId;

    // Trova il livello successivo con esperienza richiesta minore o uguale a quella del giocatore
    final nextLevel = await (db.select(db.levels)
          ..where((l) => l.requiredExperience.isSmallerOrEqualValue(playerExperience))
          ..orderBy([(l) => OrderingTerm(expression: l.requiredExperience, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();

    return (nextLevel != null && nextLevel.id != currentLevelId) ? nextLevel.id : currentLevelId;
  }

  Future<void> afterPlayerInteraction() async {
    final db = await openDatabase();

    // Controlla le quest completate
    List<dynamic> completedQuests = await getCompletedQuests(_partitaMap["quest_active_list"]);
    
    for (var questId in completedQuests) {
      final quest = await db.getQuestById(questId);

      // Aggiorna crediti, esperienza e like in base all'esito della quest
      if (_partitaMap["credit"] >= (quest.minimumMoneyRequired ?? 0) &&
          _partitaMap["credit"] <= (quest.maximumMoneyRequired ?? double.infinity) &&
          _partitaMap["like"] >= (quest.minimumLikeRequired ?? 0) &&
          _partitaMap["like"] <= (quest.maximumLikeRequired ?? double.infinity)) {
        
        _partitaMap["credit"] += (quest.moneyAddedSuccess ?? 0);
        _partitaMap["experience"] += (quest.experienceAdded ?? 0);
        _partitaMap["like"] += (quest.likeAddedSuccess ?? 0);
      } else {
        _partitaMap["credit"] += (quest.moneyAddedFailure ?? 0);
        _partitaMap["like"] += (quest.likeAddedFailure ?? 0);
      }

      _partitaMap["quest_done_list"][questId.toString()] = 1;
      _partitaMap["quest_active_list"].remove(questId);

      _quests.removeWhere((q) => q.id == questId);

      // TODO: modal risultato quest
    }

    // Controlla se il giocatore può salire di livello
    int nextLevelId = await getNextLevelIfEligible(_partitaMap["level"], _partitaMap["experience"]);
    if (nextLevelId > _partitaMap["level"]) {
      _partitaMap["level"] = nextLevelId;

      // Aggiungi nuovi materiali disponibili al livello
      List<int> newMaterials = await db.getMaterialsIdByLevelNumber(nextLevelId);
      for (var materialId in newMaterials) {
        if (!_partitaMap["material_discovered_list"].contains(materialId)) {
          _partitaMap["material_discovered_list"].add(materialId);
        }
      }

      // Aggiorna categorie disponibili
      _categories = await db.getConnectedCategories(_partitaMap["material_discovered_list"]);

      // Carica nuove quest disponibili per il nuovo livello
      _quests = await db.getDoableQuests(_partitaMap["level"], _partitaMap["quest_done_list"]);
    }

    savePartita();
    notifyListeners();
  }

  Future<void> loadLastMaterials() async { // serve per caricare gli ultimi materiali prodotti e usati
    final db = await openDatabase();

    _materials = await db.getSelectedMaterials(_lastMaterials.map((e) => e.id).toList());

    notifyListeners();
  }

  Future<void> checkCombination() async {
    final db = await openDatabase();

    _newMaterials = await db.getCombinationProducts(_partitaMap["level"], _materialsToCombine);
    _lastMaterials.addAll(_materialsToCombine);

    // aggiungi a _partitaMap["material_discovered_list"], se non sono già presenti nella lista, tutti gli id dei materiali appena prodotti. Aggiorna crediti e esperienza
    for (var materialeSingolo in _newMaterials) {
      if (!_partitaMap["material_discovered_list"].contains(materialeSingolo.id)) {
        _partitaMap["material_discovered_list"].add(materialeSingolo.id);
        _partitaMap["credit"] += materialeSingolo.price;
        _partitaMap["experience"] += materialeSingolo.experience;
      }
    }

    // carica lista categorie correlate da DB
    _categories = await db.getConnectedCategories(_partitaMap["material_discovered_list"]);

    if (newMaterials.isNotEmpty) { // svuota _materialsToCombine se sono stati prodotti materiali
      _materialsToCombine.clear();
    } else { // altrimenti aggiorna il contatore di penalità
      _contatorePenalita++;
      if (_contatorePenalita  >= maxFallimenti) { // dopo x fallimenti, punisci
        _contatorePenalita = 0;
        _materialsToCombine.clear();
        // esegui penalità
        _partitaMap["credit"] -= _partitaMap["credit"] * punizioneFallimentoCombinazionePercentuale;
        if (_partitaMap["credit"] < 0) {
          _partitaMap["credit"] = 0;
        }
      }
    }

    notifyListeners();

    //afterPlayerInteraction() non viene chiamata direttamente da questa funzione, ma dopo che il giocatore avrà preso visione dei materiali eventualmente sbloccati
  }

  Future<void> showQuestDetails(BuildContext context, int questId) async {
    final db = await openDatabase();
    final quest = await db.getQuestById(questId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      WoltModalSheet.show(
        context: context,
        modalTypeBuilder: (_) => WoltModalType.dialog(),
        pageListBuilder: (modalSheetContext) => [
          SliverWoltModalSheetPage(
            pageTitle: Text(
              quest.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            mainContentSliversBuilder: (context) => [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      quest.description,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    if (quest.startingDialog.isNotEmpty) ...[
                      Text(
                        '"${quest.startingDialog}"',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _partitaMap["quest_active_list"].add(questId);
                            Navigator.of(context).pop(true);
                            notifyListeners();
                          },
                          child: Text(quest.acceptButton),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _partitaMap["quest_done_list"][questId.toString()] = 0;
                            _quests.removeWhere((q) => q.id == questId);
                            _partitaMap["quest_active_list"].remove(questId);
                            Navigator.of(context).pop(false);
                            notifyListeners();
                          },
                          child: Text(quest.declineButton),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ).then((value) {
        notifyListeners();
      });
    });
    notifyListeners();
}

  Future<void> loadPartita(String numeroPartita) async {
    final db = await openDatabase();

    _numeroPartita = numeroPartita;
    final prefs = await SharedPreferences.getInstance();
    _partitaData = prefs.getString(_numeroPartita) ?? "Dati non trovati";

    if (_partitaData != "Dati non trovati") {
      _partitaMap = jsonDecode(_partitaData);
    }

    // aggiungi a _partitaMap["material_discovered_list"], se non sono già presenti nella lista, tutti gli id dei materiali già disponibili dall'inizio della partita e che non siano acquistabili
    final List<int> startingMaterials = await db.getMaterialsIdByLevelNumber(primoLivelloNumero);

    for (var materialId in startingMaterials) {
      if (!_partitaMap["material_discovered_list"].contains(materialId)) {
        _partitaMap["material_discovered_list"].add(materialId);
      }
    }

    // carica lista categorie correlate da DB
    _categories = await db.getConnectedCategories(_partitaMap["material_discovered_list"]);

    // carica lista materiali scoperti di una categoria sola (ultima scoperta)
    loadMaterialsByCategory(_categories.isEmpty ? 0 : _categories.last.id);

    // carica lista quest del livello che non risultino già in quest_done_list
    _quests = await db.getDoableQuests(_partitaMap["level"], _partitaMap["quest_done_list"]);

    savePartita();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> savePartita() async {
    final prefs = await SharedPreferences.getInstance();

    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss - dd/MM/yy').format(now);

    _partitaMap["last_save"] = formattedDate;

    await prefs.setString(_numeroPartita, jsonEncode(_partitaMap));
  }

  Future<void> removeFromCombination(materiale) async {
    if (_materialsToCombine.contains(materiale)) {
      _materialsToCombine.remove(materiale);
    }

    notifyListeners();
  }

  Future<void> onMaterialDropped(idMaterialeInt) async {
    List<int> monoLista = [];
    monoLista.add(idMaterialeInt);

    final db = await openDatabase();

    // se non è un duplicato, aggiungi il materiale con idMaterialeInt a _materialsToCombine
    final List<database.Material> addedMaterial = await db.getSelectedMaterials(monoLista);

    for (var material in addedMaterial) {
      if (!_materialsToCombine.contains(material)) {
        _materialsToCombine.add(material);
      }
    }

    notifyListeners();
  }
}