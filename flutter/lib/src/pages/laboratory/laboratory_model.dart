import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final List<database.Material> _materialsToCombine = [];
  List<database.Category> _categories = [];
  List<database.Quest> _quests = [];
  Map<String, dynamic> _partitaMap = {"level":1,"like":0,"experience":0,"credit":0,"combination_done_list":{},"unuseful_combinations":0,"quest_done_list":{},"quest_active_list":[],"material_discovered_list":[] ,"last_save":"18:20:00 - 05/12/91"};

  // listeners
  Map<String, dynamic> get partitaMap => _partitaMap;
  List<database.Material> get materials => _materials;
  List<database.Category> get categories => _categories;
  List<database.Quest> get quests => _quests;
  bool get isLoading => _isLoading;
  List<database.Material> get materialsToCombine => _materialsToCombine;

  Future<void> loadMaterialsByCategory(dynamic idCategoria) async {
    final db = await openDatabase();

    final idCategoriaInt = idCategoria as int;
    _materials = await db.getMaterialsByCategory(idCategoriaInt, _partitaMap["material_discovered_list"]);
  
    notifyListeners();
  }

  Future<void> afterPlayerInteraction() async {
    // TODO: 

    savePartita();

    notifyListeners();
  }

  Future<void> checkCombination() async {
    // TODO: 

    afterPlayerInteraction();

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