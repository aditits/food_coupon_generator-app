import 'dart:io';

import 'package:flutter/material.dart';
import 'package:coupon_app/base/localization/app_localization.dart';


class BaseLayout {
  String getStringValue(String key, BuildContext context) {
    if (key == null || key.isEmpty) return "";
    if (context != null) {
      return AppLocalization.getStringsValue(context, key);
    }
    return '';
  }

  Future<bool> requestPop() {
    exit(0);
    return new Future.value(true);
  }
}
