import 'package:flutter/material.dart';
import 'package:coupon_app/base/localization/language.dart';

class AppLocalization {
  AppLocalization(this.locale);
  final Locale locale;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': Language.mapEn,
  };

  String getStrings(String key) {
    return _localizedValues[locale.languageCode][key] == null
        ? ""
        : _localizedValues[locale.languageCode][key];
  }

  static String getStringsValue(BuildContext context, String key) {
    String value = "";
    if (key == null || key.isEmpty) {
      return "";
    }
    if (context == null) {
      return "";
    }
    try {
      value = AppLocalization.of(context).getStrings(key);
    } catch (e) {
      print("Error in getStringsValue in AppLocalization: " + e.toString());
    }
    return value;
  }
}
