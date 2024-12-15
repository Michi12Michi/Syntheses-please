import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../utils/app_database.dart';
import '../../utils/app_database_shared.dart' as database;

// QUI AVVIENE TUTTA LA GESTIONE DELLA LOGICA DELLA PAGINA DELLE QUEST

class QuestsModel with ChangeNotifier {

  bool _isLoading = true;
  String _partitaData = "Dati non trovati";
  List<database.Character> _characters = [];
  List<database.Quest> _quests = [];
  Map<String, dynamic> _partitaMap = {"level":1,"like":0,"experience":0,"credit":0,"combination_done_list":{},"unuseful_combinations":0,"quest_done_list":{},"quest_active_list":[],"material_discovered_list":[] ,"last_save":"18:20:00 - 05/12/91"};

  // TIPOLOGIE DI QUEST
  final List<database.Quest> _questsSucceded = [];
  final List<database.Quest> _questsFailed = [];
  final List<database.Quest> _questsActive = [];
  final List<database.Quest> _questsDoable = [];

  // listeners
  List<database.Character> get characters => _characters;
  List<database.Quest> get questsSucceded => _questsSucceded;
  List<database.Quest> get questsOld => _questsSucceded + _questsFailed;
  List<database.Quest> get questsFailed => _questsFailed;
  List<database.Quest> get questsActive => _questsActive;
  List<database.Quest> get questsDoable => _questsDoable;
  Map<String, dynamic> get partitaMap => _partitaMap;
  bool get isLoading => _isLoading;

  bool isQuestSucceded(database.Quest quest) {
    return _questsSucceded.contains(quest) ? true : false;
  }

  database.Character getCharacterById(int? idCharacterIssuer) {
    idCharacterIssuer ??= 0;
    
    for (var element in _characters) {
      if (element.id == idCharacterIssuer) {
        return element;
      }
    }

    return database.Character(id: 0, name: "???");
  }

  Future<void> loadPartita(String numeroPartita) async {
    final db = await openDatabase();

    final prefs = await SharedPreferences.getInstance();
    _partitaData = prefs.getString(numeroPartita) ?? "Dati non trovati";

    if (_partitaData != "Dati non trovati") {
      _partitaMap = jsonDecode(_partitaData);
    }

    // ottiene tutte le quest fino al livello attuale
    _quests = await db.getAllQuestsUntilLevel(_partitaMap["level"] as int);

    // ottiene tutti i personaggi legati alle quest ottenute in precedenza
    _characters = await db.getCharactersByQuests(_quests);

    // suddivide le quest in liste in base alle informazioni del salvataggio
    final List<dynamic> activeQuestsId = _partitaMap["quest_active_list"];
    final Map<String, dynamic> questDoneMap = _partitaMap["quest_done_list"];

    for (var quest in _quests) {
      if (activeQuestsId.contains(quest.id) ) {
        _questsActive.add(quest);
      } else if (questDoneMap.containsKey(quest.id.toString())) {
        if (questDoneMap[quest.id.toString()] == 1) {
          _questsSucceded.add(quest);
        } else {
          _questsFailed.add(quest);
        }
      } else {
        _questsDoable.add(quest);
      }
    }

    _isLoading = false;

    notifyListeners();
  }

}