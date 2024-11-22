import 'package:flutter/material.dart';
import 'app_database_shared.dart' as database;
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'package:xml/xml.dart' as xml;

// Widget per visualizzare ogni materiale in modalità normale
class MaterialWidget extends StatelessWidget {
  final database.Material material;

  const MaterialWidget({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSvgImage(material.image),
            const SizedBox(height: 8),
            Text(
              material.commonName,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget per il feedback durante il drag and drop
class MaterialFeedbackWidget extends StatelessWidget {
  final database.Material material;

  const MaterialFeedbackWidget({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: MaterialWidget(material: material),
    );
  }
}

Widget buildSvgImage(String? svgString) {
  // Usa emptySvg come fallback
  String svgToRender = svgString ?? emptySvg;

  try {
    // Tenta di fare il parsing dell'SVG come XML per verificare se è valido
    final document = xml.XmlDocument.parse(svgToRender);

    // Controlla che l'SVG non contenga errori o funzioni non supportate
    if (document.toXmlString() != svgToRender) {
      //print('SVG is supported');
    }
  } catch (e) {
    //print('SVG contains unsupported features: $e');
    svgToRender = emptySvg;  // Usa l'immagine fallback in caso di errore
  }

  // Restituisce l'immagine valida o il fallback
  return SvgPicture.string(
    svgToRender,
    width: 40,
    height: 40,
  );
}