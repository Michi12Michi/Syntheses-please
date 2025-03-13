import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../utils/app_database.dart';
import '../../utils/app_database_shared.dart' as database;

// QUI AVVIENE TUTTA LA GESTIONE DELLA LOGICA DELLA PAGINA DEL NEGOZIO

class ShopModel with ChangeNotifier {

  String _partitaData = "Dati non trovati";
  String _numeroPartita = "0";
  final List<database.Material> _purchasableMaterials = [];
  Map<String, dynamic> _partitaMap = {"level":1,"like":0,"experience":0,"credit":0,"combination_done_list":{},"unuseful_combinations":0,"quest_done_list":{},"quest_active_list":[],"material_discovered_list":[] ,"last_save":"18:20:00 - 05/12/91"};

  // listeners
  Map<String, dynamic> get partitaMap => _partitaMap;
  List<database.Material> get purchasableMaterials => _purchasableMaterials;

  bool checkIfMaterialPurchased(database.Material materiale) {
    final List<dynamic> materialiScoperti = _partitaMap["material_discovered_list"];

    return materialiScoperti.contains(materiale.id) ? true : false;
  }

  Future<void> purchaseMaterial(int indice) async {

    int materialeDaComprare = _purchasableMaterials[indice].id;

    // modifiche a soldi e esperienza
    // aggiungi a _partitaMap["material_discovered_list"], se non è già presente nella lista, il materiale appena comprato
    if (!_partitaMap["material_discovered_list"].contains(materialeDaComprare)) {
      _partitaMap["material_discovered_list"].add(materialeDaComprare);
    }

    savePartita();

    notifyListeners();

    // afterPlayerInteraction() verrà lanciato quando si tornerà alla pagina del laboratorio, con controllo delle quest ecc.
  }

  Future<void> savePartita() async {
    final prefs = await SharedPreferences.getInstance();

    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss - dd/MM/yy').format(now);

    _partitaMap["last_save"] = formattedDate;

    await prefs.setString(_numeroPartita, jsonEncode(_partitaMap));
  }

  Future<void> loadPartita(String numeroPartita) async {
    final db = await openDatabase();

    _numeroPartita = numeroPartita;
    final prefs = await SharedPreferences.getInstance();
    _partitaData = prefs.getString(_numeroPartita) ?? "Dati non trovati";

    if (_partitaData != "Dati non trovati") {
      _partitaMap = jsonDecode(_partitaData);
    }

    // aggiungi a _purchasableMaterials, se non sono già presenti nella lista, tutti i materiali acquistabili
    List<database.Material> purchasable = await db.getAllMaterialsPurchasable();

    _purchasableMaterials.clear();

    for (var material in purchasable) {
      _purchasableMaterials.add(material);
    }

    notifyListeners();
  }

}