import 'package:flutter/material.dart';

// WARN: ogni volta che qualcosa cambia in app_database_shared.dart (l'unico file dove vanno definite le funzioni e le classi relative alla comunicazione col DB), deve essere eseguito nel terminale il comando flutter pub run build_runner build
// WARN: è necessario che nella cartella web siano presenti sqlite.wasm e drift_worker.js, scaricabili da questo sito https://drift.simonbinder.eu/platforms/web/#supported-browsers 
// WARN: negli assets vanno aggiunte le immagini relative a quests, characters e blog. Vanno estratte dal DB tramite uno script python.

// WARN: passa a ogni pagina di gioco (laboratorio, negozio, diario, quest) il numero partita e solo tramite il JSON collegato salvato in shared_preferences deve essere possibile giocare: ogni pagina è standalone

// WARN: // ignore_for_file: type=lint, unnecessary_null_comparison, unnecessary_non_null_assertion

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
