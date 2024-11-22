import 'package:drift/wasm.dart';
import 'package:flutter/services.dart';
import 'app_database_shared.dart';


class AppDatabase extends SharedAppDatabase {
  AppDatabase(super.e);
}

AppDatabase? _databaseInstance;

// Funzione per aprire il database SQLite
Future<AppDatabase> openDatabase() async {
  if (_databaseInstance != null) return _databaseInstance!;

  // Usa il WebExecutor di drift_wasm
  final executor = await WasmDatabase.open(
    databaseName: 'chimgio.db', // prefer to only use valid identifiers here
    sqlite3Uri: Uri.parse('sqlite3.wasm'),
    driftWorkerUri: Uri.parse('drift_worker.dart.js'), 
    initializeDatabase: () async {
      final data = await rootBundle.load('assets/chimgio.db');
      return data.buffer.asUint8List();
    },
  ); // https://drift.simonbinder.eu/platforms/web/#setup-in-dart

  _databaseInstance = AppDatabase(executor.resolvedExecutor); // Crea l'istanza Singleton
  return _databaseInstance!;
}
