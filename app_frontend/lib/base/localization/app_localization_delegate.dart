import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coupon_app/base/models/constant.dart';
import 'app_localization.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriderLocale;
  const AppLocalizationDelegate(this.overriderLocale);

  @override
  bool isSupported(Locale locale) => overriderLocale != null
      ? true
      : ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    if (overriderLocale != null) {
      locale = overriderLocale;
    } else {
      locale = Constants.english;
    }
    return new SynchronousFuture<AppLocalization>(new AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => overriderLocale != null;
}
