import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'laboratory_model.dart';
import '../shop/shop_view.dart';
import '../blog/blog_view.dart';
import '../quests/quests_view.dart';
import '../../utils/common_widgets.dart';

class LaboratoryView extends StatelessWidget {
  const LaboratoryView({super.key, required this.numeroPartita});
  
  final String numeroPartita;
  static const routeName = '/laboratory';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaboratoryModel()..loadPartita(numeroPartita),
        child: Scaffold(
        appBar: AppBar(
          title: const Text("Mboka Lab"),
        ),
        body: Consumer<LaboratoryModel>(
          builder: (context, viewModel, _) {

            if (viewModel.isLoading) { // caricamento, possiamo mettere qualsiasi cosa
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Stack(
              alignment: Alignment.topLeft,
              children: [

                Container( // SFONDO
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF47456D),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),

                Column( // QUESTA COLONNA CONTIENE TUTTE LE RIGHE DELLA PAGINA
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded( // CONTENITORE CATEGORIE
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(40, 255, 255, 255),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.zero,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: viewModel.categories.map((category) {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.loadMaterialsByCategory(category.id);
                                },
                                child: Container(
                                  width: 100,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(60, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        buildSvgImage(category.image),
                                        const SizedBox(height: 8),
                                        Text(
                                          category.name,
                                          style: const TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Expanded( // CONTENITORE MATERIALI
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(40, 255, 255, 255),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.zero,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: viewModel.materials.map((material) {
                              return Draggable<int>(
                                data: material.id,  // ID materiale per drag and drop
                                feedback: MaterialFeedbackWidget(material: material),
                                childWhenDragging: Opacity(
                                  opacity: 0.5,
                                  child: MaterialWidget(material: material),
                                ),
                                child: MaterialWidget(material: material),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x1f000000),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.zero,
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded( // BOTTONI NAVIGAZIONE
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.book),
                                    onPressed: () {
                                      if (context.mounted) {
                                        Navigator.restorablePushNamed(context, BlogView.routeName, arguments: <String, dynamic> {"numeroPartita": numeroPartita, "blogId": 1});
                                      }
                                    },
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    iconSize: 24,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.shopping_bag_outlined),
                                    onPressed: () {
                                      if (context.mounted) {
                                        Navigator.restorablePushNamed(context, ShopView.routeName, arguments: <String, dynamic> {"numeroPartita": numeroPartita});
                                      }
                                    },
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    iconSize: 24,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.person_pin_rounded),
                                    onPressed: () {
                                      if (context.mounted) {
                                        Navigator.restorablePushNamed(context, QuestsView.routeName, arguments: <String, dynamic> {"numeroPartita": numeroPartita});
                                      }
                                    },
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    iconSize: 24,
                                  ),
                                ],
                              ),
                            ),
                            Expanded( // ZONA DROP
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  DragTarget<int>(
                                    onAcceptWithDetails: (materialId) {
                                      viewModel.onMaterialDropped(materialId.data);
                                    },
                                    builder: (context, candidateData, rejectedData) {
                                      return Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(90, 27, 13, 153),
                                          border: Border.all(color: Colors.white, width: 3),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Rilascia',
                                            style: const TextStyle(color: Colors.white, fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            Expanded( // ZONA LISTA QUEST
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: false,
                                      physics: ScrollPhysics(),
                                      children: viewModel.quests.map((quest) {
                                        return GestureDetector(
                                          onTap: () {
                                            // TODO: viewModel.showQuestDetails(quest.id);
                                          },
                                          child: Container(
                                            width: 100,
                                            margin: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(60, 0, 0, 0),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  //TODO: buildSvgImage(quest.image), in realtà carica png del personaggio
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    quest.name,
                                                    style: const TextStyle(color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded( // ZONA REAZIONE
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x1f000000),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.zero,
                          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...viewModel.materialsToCombine.map((material) {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.removeFromCombination(material);
                                },
                                child: MaterialWidget(material: material),
                                );
                              }),
                              // Bottone freccia alla fine
                              Visibility(
                                visible: viewModel.materialsToCombine.length > 1,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // TODO: viewModel.checkCombination();
                                  },
                                ),
                              ),
                            ]
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ],
            );
          }
        )
      )
    );
  }
}