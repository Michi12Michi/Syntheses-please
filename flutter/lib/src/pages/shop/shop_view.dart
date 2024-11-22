import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/common_widgets.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'shop_model.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key, required this.numeroPartita});

  final String numeroPartita;
  static const routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShopModel()..loadPartita(numeroPartita),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Black Market'),
        ),
        body: Stack(
          children:[

            Container( // SFONDO
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF47456D),
                image: const DecorationImage(
                  image: AssetImage('assets/images/market.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),

            Consumer<ShopModel>( // GRIGLIA
              builder: (context, viewModel, _) {
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: viewModel.purchasableMaterials.length,
                  itemBuilder: (context, index) {
                    final material = viewModel.purchasableMaterials[index];
                    return GestureDetector(
                      onTap: () {
                        if (viewModel.checkIfMaterialPurchased(material)) {
                          WoltModalSheet.show(
                            context: context,
                            modalTypeBuilder: (_) => WoltModalType.dialog(),
                            pageListBuilder: (modalSheetContext) => [
                              SliverWoltModalSheetPage(
                                pageTitle: Text(
                                  'Acquista ${material.commonName}',
                                  textAlign: TextAlign.center,
                                  ),
                                mainContentSliversBuilder: (context) => [
                                  SliverList(
                                    delegate: SliverChildListDelegate([
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Immagine del materiale
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(16.0),
                                              child: buildSvgImage(material.image),
                                            ),
                                            const SizedBox(height: 16),
                                            // Dettagli del materiale
                                            Text(
                                              'Prezzo: ${material.price} monete',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              material.commonName,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(height: 16),
                                            // Pulsanti di azione
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                // Pulsante "Annulla"
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey,
                                                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(modalSheetContext).pop();
                                                  },
                                                  child: const Text('Annulla'),
                                                ),
                                                // Pulsante "Conferma"
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                                  ),
                                                  onPressed: () {
                                                    // TODO: viewModel.purchaseMaterial(material);
                                                    Navigator.of(modalSheetContext).pop();
                                                  },
                                                  child: const Text('Conferma'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: buildSvgImage(material.image),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0x6e000000),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                            ),
                          ),
                          Text(
                            material.commonName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Visibility(
                            visible: !viewModel.checkIfMaterialPurchased(material),
                            child: Text(
                              "Già presente nell'inventario.",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ], 
        ),
      ),
    );
  }
}