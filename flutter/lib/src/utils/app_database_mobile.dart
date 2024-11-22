import 'package:drift/native.dart';  // Per mobile/desktop (SQLite)
import 'app_database_shared.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Per ottenere il percorso della directory dei documenti
import 'package:flutter/services.dart'; // Per accedere agli assets

class AppDatabase extends SharedAppDatabase {
  AppDatabase(super.e);
}

AppDatabase? _databaseInstance;

// Funzione per copiare e aprire il database SQLite
Future<AppDatabase> openDatabase() async {
  if (_databaseInstance != null) return _databaseInstance!;

  // Ottieni la directory dei documenti dell’app
  final directory = await getApplicationDocumentsDirectory();
  final dbPath = '${directory.path}/chimgio.db';

  // Verifica se il database è già stato copiato
  final dbFile = File(dbPath);
  if (!await dbFile.exists()) {
    // Copia il database dagli assets alla directory dei documenti
    final data = await rootBundle.load('assets/chimgio.db');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await dbFile.writeAsBytes(bytes);
  }

  // Crea l'executor per il database usando Drift e il percorso copiato
  final executor = NativeDatabase(dbFile);
  _databaseInstance = AppDatabase(executor); // Crea l'istanza Singleton
  return _databaseInstance!;
}