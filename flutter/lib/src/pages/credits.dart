import 'package:flutter/material.dart';
import '../utils/app_database.dart';
import '../utils/app_database_shared.dart';

class CreditsView extends StatelessWidget {
  const CreditsView({super.key});

  static const routeName = '/credits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crediti'),
      ),
      body: Center(
        child: FutureBuilder<AppDatabase>(
          future: openDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Errore: ${snapshot.error}');
            }

            final database = snapshot.data;

            return FutureBuilder<List<Credit>>(
              future: database!.getAllCredits(),
              builder: (context, creditSnapshot) {
                if (creditSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (creditSnapshot.hasError) {
                  return Text('Errore: ${creditSnapshot.error}');
                }

                final credits = creditSnapshot.data ?? [];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: credits.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            credits[index].credit,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}