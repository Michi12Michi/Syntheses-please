import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../utils/app_database.dart';
import '../../utils/app_database_shared.dart' as database;

// QUI AVVIENE TUTTA LA GESTIONE DELLA LOGICA DELLA PAGINA DEL DIARIO

class BlogModel with ChangeNotifier {

  bool _isLoading = true;
  String _partitaData = "Dati non trovati";
  database.Blog _blogPage = database.Blog(
    id: 0,
    level: 0,
    title: "...",
    description: "Nulla di importante.",
  );
  Map<String, dynamic> _partitaMap = {"level":1,"like":0,"experience":0,"credit":0,"combination_done_list":{},"unuseful_combinations":0,"quest_done_list":{},"quest_active_list":[],"material_discovered_list":[] ,"last_save":"18:20:00 - 05/12/91"};

  // listeners
  Map<String, dynamic> get partitaMap => _partitaMap;
  database.Blog get blogPage => _blogPage;
  bool get isLoading => _isLoading;

  Future<void> sfogliaPagina(int idBlog, String direzione) async {
    final db = await openDatabase();

    // recupera la prossima pagina di diario dal DB, se esiste
    try {
      final nextPage = await db.getNextBlogPage(idBlog, direzione);
      _blogPage = nextPage;
      notifyListeners();
    // ignore: empty_catches
    } catch (e) {
      
    }
  }

  Future<void> loadPartita(String numeroPartita, int idBlog) async {
    final db = await openDatabase();

    final prefs = await SharedPreferences.getInstance();
    _partitaData = prefs.getString(numeroPartita) ?? "Dati non trovati";

    if (_partitaData != "Dati non trovati") {
      _partitaMap = jsonDecode(_partitaData);
    }

    // recupera la pagina di diario dal DB
    _blogPage = await db.getBlogPage(idBlog);

    _isLoading = false;

    notifyListeners();
  }

}