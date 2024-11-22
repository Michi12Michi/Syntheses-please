import 'package:flutter/material.dart';
import 'laboratory/laboratory_view.dart';
import 'resuming.dart';
import 'credits.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../settings/settings_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  static const routeName = '/menu';

  Future<String> avviaNuovaPartita() async {
    final prefs = await SharedPreferences.getInstance();

    // Controlla e aggiorna il numero di partite, ma è solo un contatore per l'incremento
    int numeroPartite = prefs.getInt('numeroPartite') ?? 0;
    numeroPartite += 1;
    await prefs.setInt('numeroPartite', numeroPartite);

    // Ottieni la data e l'ora attuali formattate come richiesto
    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss - dd/MM/yy').format(now);

    // Crea i parametri di una nuova partita
    final nuovaPartita = {
      "level": 1,
      "like": 0,
      "experience": 0,
      "credit": 0,
      "combination_done_list": <int, int>{},
      "unuseful_combinations": 0,
      "quest_done_list": <int, int>{},
      "quest_active_list": <int>[],
      "material_discovered_list": <int>[],
      "material_to_combine_list": <int>[],
      "last_save": formattedDate,
    };

    // Salva la nuova partita come JSON in shared_preferences
    final partitaKey = numeroPartite.toString();
    await prefs.setString(partitaKey, jsonEncode(nuovaPartita));

    return partitaKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                String numeroPartita = await avviaNuovaPartita();
                if (context.mounted) {
                  Navigator.restorablePushNamed(context, LaboratoryView.routeName, arguments: {"numeroPartita": numeroPartita});
                }
              },
              child: const Text('Nuova partita'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, ResumingView.routeName);
              },
              child: const Text('Riprendi partita'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              child: const Text('Impostazioni'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, CreditsView.routeName);
              },
              child: const Text('Crediti'),
            ),
          ],
        ),
      ),
    );
  }
}