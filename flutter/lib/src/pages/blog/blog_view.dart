import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../../utils/common_widgets.dart';
import 'blog_model.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key, required this.numeroPartita, required this.blogId});

  final String numeroPartita; // attualmente non è usato, ma potrebbe, es.: mostra le combinazioni già realizzate associate a una pagina di diario
  final int blogId;
  static const routeName = '/blog';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogModel()..loadPartita(numeroPartita, blogId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Diario'),
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

            Consumer<BlogModel>( // PAGINA DIARIO
              builder: (context, viewModel, _) {
                
                if (viewModel.isLoading) { // caricamento, possiamo mettere qualsiasi cosa
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onDoubleTapDown: (details) {
                    // Ottieni la larghezza dello schermo
                    final screenWidth = MediaQuery.of(context).size.width;

                    // Controlla se il tap è nella metà sinistra o destra dello schermo
                    if (details.globalPosition.dx < screenWidth / 2) {
                      // Tap nella metà sinistra
                      
                      viewModel.sfogliaPagina(viewModel.blogPage.id, "sinistra");
                    } else {
                      // Tap nella metà destra
                      viewModel.sfogliaPagina(viewModel.blogPage.id, "destra");
                    }
                  },
                  onHorizontalDragEnd: (details) {
                    if (details.velocity.pixelsPerSecond.dx > 10) {
                      // swipe verso destra
                      viewModel.sfogliaPagina(viewModel.blogPage.id, "sinistra"); // sfoglia verso sinistra
                    } else if (details.velocity.pixelsPerSecond.dx < -10) {
                      // swipe verso sinistra
                      viewModel.sfogliaPagina(viewModel.blogPage.id, "destra"); // sfoglia verso destra
                    }
                  },
                  child: Column(
                    children: [
                      // Prima sezione: immagine che si adatta alla larghezza della pagina
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/blog/${viewModel.blogPage.id.toString()}.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/blog/0.png',
                              fit: BoxFit.contain,
                              width: double.infinity,
                            );
                          },
                        )
                      ),
                      // Seconda sezione: testo scrollabile
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                          hitTestBehavior: HitTestBehavior.translucent,
                          scrollDirection: Axis.vertical,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              viewModel.blogPage.description ?? "", 
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
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