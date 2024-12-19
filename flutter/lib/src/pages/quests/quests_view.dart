import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../../utils/common_widgets.dart';
import 'quests_model.dart';

// TODO: mostra solo le vecchie quest in una versione molto dettagliata

class QuestsView extends StatelessWidget {
  const QuestsView({super.key, required this.numeroPartita});

  final String numeroPartita; 
  static const routeName = '/quests';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestsModel()..loadPartita(numeroPartita),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Richieste'),
        ),
        body: Stack(
          children:[

            Container( // SFONDO
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                /*image: const DecorationImage(
                  image: AssetImage('assets/images/market.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),*/
              ),
            ),

            Consumer<QuestsModel>( // PAGINA RICHIESTE
              builder: (context, viewModel, _) {
                
                if (viewModel.isLoading) { // caricamento, possiamo mettere qualsiasi cosa
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                  
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                        child: Text(
                          "Richieste attive",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        padding: EdgeInsets.all(0),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0x00ffffff),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.zero,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: viewModel.questsActive.length,
                          itemBuilder: (context, index) {
                            final quest = viewModel.questsActive[index];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                      child: Image.asset(
                                        'assets/images/characters/${quest.characterIssuer.toString()}.png',
                                        height: 130,
                                        width: 120,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/characters/0.png',
                                            height: 130,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                    child: Text(
                                      viewModel.getCharacterById(quest.characterIssuer).name,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 11,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                                    child: Text(
                                      quest.name,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Nuove richieste",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),


                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: viewModel.questsDoable.length,
                        itemBuilder: (context, index) {
                          final quest = viewModel.questsDoable[index];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.asset(
                                    'assets/images/characters/${quest.characterIssuer.toString()}.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/characters/0.png',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          viewModel.getCharacterById(quest.characterIssuer).name,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            quest.name,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                      
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Vecchie richieste",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),


                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: viewModel.questsOld.length,
                        itemBuilder: (context, index) {
                          final quest = viewModel.questsOld[index];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.asset(
                                    'assets/images/characters/${quest.characterIssuer.toString()}.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/characters/0.png',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          viewModel.getCharacterById(quest.characterIssuer).name,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        Text(
                                          viewModel.isQuestSucceded(quest) ? "Riuscita" : "Fallita",
                                          textAlign: TextAlign.end,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: viewModel.isQuestSucceded(quest) ? Color.fromARGB(255, 60, 255, 0) : Color.fromARGB(255, 255, 0, 0),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            quest.name,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                );
              },
            )
          ], 
        ),
      ),
    );
  }
}