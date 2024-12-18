// IMPLEMENTACIÓN DE SELECCIÓN DE FUENTE

import 'package:flutter/material.dart';

class FontSettings {
  static double fontSize = 16.0; // Tamaño de fuente predeterminado
  static String fontFamily = 'Roboto'; // Fuente predeterminada

  static void updateFontSize(double size) {
    fontSize = size;
  }

  static void updateFontFamily(String family) {
    fontFamily = family;
  }
}

class FontCustomizer extends StatefulWidget {
  const FontCustomizer({super.key});

  @override
  _FontCustomizerState createState() => _FontCustomizerState();
}

class _FontCustomizerState extends State<FontCustomizer> {
  final List<String> fontOptions = [
    'Roboto',
    'Arial',
    'Times New Roman',
    'Courier New',
    'Verdana',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personalizar Fuente"),
      ),
      body: Column(
        children: [
          const Text(
            "Prueba de texto",
            style: TextStyle(fontSize: 16.0),
          ),
          DropdownButton<String>(
            value: FontSettings.fontFamily,
            items: fontOptions.map<DropdownMenuItem<String>>((String font) {
              return DropdownMenuItem<String>(
                value: font,
                child: Text(font),
              );
            }).toList(),
            onChanged: (String? newFont) {
              setState(() {
                if (newFont != null) {
                  FontSettings.updateFontFamily(newFont);
                }
              });
            },
          ),
          Slider(
            value: FontSettings.fontSize,
            min: 12.0,
            max: 32.0,
            onChanged: (value) {
              setState(() {
                FontSettings.updateFontSize(value);
              });
            },
          ),
          Text(
            "Texto con configuración personalizada",
            style: TextStyle(
              fontSize: FontSettings.fontSize,
              fontFamily: FontSettings.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
