import 'dart:convert'; // Per decodificare il JSON
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'laboratory/laboratory_view.dart';

class ResumingView extends StatefulWidget {
  const ResumingView({super.key});

  static const routeName = '/resuming';

  @override
  ResumingViewState createState() => ResumingViewState();
}

class ResumingViewState extends State<ResumingView> {
  List<Map<String, dynamic>> partite = [];

  @override
  void initState() {
    super.initState();
    _loadPartite();
  }

  // Carica le partite da SharedPreferences
  Future<void> _loadPartite() async {
    final prefs = await SharedPreferences.getInstance();
    final numeroPartite = prefs.getInt('numeroPartite') ?? 0;

    List<Map<String, dynamic>> loadedPartite = [];
    for (int i = 1; i <= numeroPartite; i++) {
      final partitaJson = prefs.getString(i.toString());
      if (partitaJson != null) {
        final partita = jsonDecode(partitaJson);
        loadedPartite.add({
          'numeroPartita': i,
          'level': partita['level'],
          'last_save': partita['last_save'],
        });
      }
    }

    setState(() {
      partite = loadedPartite;  // Aggiorna la lista con i dati letti
    });
  }

  // Funzione per eliminare la partita da SharedPreferences
  Future<void> _eliminaPartita(int numeroPartita) async {
    final prefs = await SharedPreferences.getInstance();
    final numeroPartite = prefs.getInt('numeroPartite') ?? 0;

    if (numeroPartite > 0) {
      // Rimuove la chiave corrispondente alla partita
      await prefs.remove(numeroPartita.toString());

      // Ricarica le partite per aggiornare la UI
      _loadPartite();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riprendi partita'),
      ),
      body: partite.isEmpty
          ? const Center(child: Text("Nessuna partita salvata."))
          : Center(  // Centro il contenuto
              child: ListView.builder(
                itemCount: partite.length,
                itemBuilder: (context, index) {
                  final partita = partite[index];
                  final level = partita['level'];
                  final lastSave = partita['last_save'];
                  final numeroPartita = partita['numeroPartita'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,  // Centra gli elementi nella riga
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Naviga alla pagina Laboratory passando il numero della partita
                            Navigator.restorablePushNamed(context, LaboratoryView.routeName, arguments: {"numeroPartita": numeroPartita.toString()});
                          },
                          child: Text('Level: $level, Last Save: $lastSave'),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Mostra il dialogo di conferma per la cancellazione
                            _showDeleteConfirmationDialog(numeroPartita);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  // Mostra un dialogo di conferma prima di eliminare la partita
  void _showDeleteConfirmationDialog(int numeroPartita) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conferma eliminazione'),
          content: const Text('Sei sicuro di voler eliminare questa partita?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Chiudi il dialogo senza fare nulla
              },
              child: const Text('Annulla'),
            ),
            TextButton(
              onPressed: () async {
                // Elimina la partita
                await _eliminaPartita(numeroPartita);

                if (context.mounted) {
                  Navigator.of(context).pop();  // Chiudi il dialogo dopo aver eliminato
                }
              },
              child: const Text('Elimina'),
            ),
          ],
        );
      },
    );
  }
}