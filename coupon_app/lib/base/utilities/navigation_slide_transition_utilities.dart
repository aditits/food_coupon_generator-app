import 'package:flutter/material.dart';

class NavigationSlideTransitionUtilities {
  static Future<dynamic> pushNavigation(BuildContext context, Widget widget) {
    if (context == null) return null;
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      }),
    );
  }
}
