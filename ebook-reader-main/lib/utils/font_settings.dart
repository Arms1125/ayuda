// IMPLEMENTACIÓN INICIAL DEL AJUSTE DE TAMAÑO DE FUENTE

import 'package:flutter/material.dart';

class FontSettings {
  static double fontSize = 16.0; // Tamaño de fuente predeterminado

  static void updateFontSize(double size) {
    fontSize = size;
  }
}

class FontSizeAdjuster extends StatefulWidget {
  const FontSizeAdjuster({super.key});

  @override
  _FontSizeAdjusterState createState() => _FontSizeAdjusterState();
}

class _FontSizeAdjusterState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajustar Tamaño de Fuente"),
      ),
      body: Column(
        children: [
          const Text(
            "Prueba de texto",
            style: TextStyle(fontSize: 16.0),
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
        ],
      ),
    );
  }
}

