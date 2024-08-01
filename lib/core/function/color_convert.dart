import 'package:flutter/material.dart';

List<Color> convertStringToColors(String colorString) {
  Map<String, Color> colorMap = {
    'black': Colors.black,
    'white': Colors.white,
    'red': Colors.red,
    'gold': Colors.amber,
    'grey': Colors.grey,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'brown': Colors.brown,
    'pink': Colors.pink,
  };

  List<String> colorNames = colorString.split(' ');
  List<Color> colors = [];

  for (String colorName in colorNames) {
    Color? color = colorMap[colorName.toLowerCase()];
    if (color != null) {
      colors.add(color);
    }
  }

  return colors;
}
