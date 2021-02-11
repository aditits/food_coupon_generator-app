import 'dart:ui';

import 'package:color/color.dart' as co;

class ColorUtilities {
  static Color getColorFromHex(String hex) {
    co.RgbColor rgbColor = co.HexColor(hex).toRgbColor();
    return Color.fromRGBO(rgbColor.r, rgbColor.g, rgbColor.b, 1);
  }
}
