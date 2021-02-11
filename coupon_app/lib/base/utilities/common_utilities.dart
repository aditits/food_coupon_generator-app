import 'package:flutter/material.dart';

class CommonUtilities {
  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  static double getImageWidth(BuildContext context, int crossAxisCount) {
    double width = MediaQuery.of(context).size.width;
    double imageWidth = width / crossAxisCount - 28;
    return imageWidth;
  }
}
