import 'dart:core';
import 'package:coupon_app/services/http_requests/api_base_helper.dart';
import 'package:coupon_app/services/localstorage_service.dart';
import 'package:coupon_app/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';


class AuthenticationProvider with ChangeNotifier {
  ApiBaseHelper _helper = ApiBaseHelper();
  static var storageService = locator<LocalStorageService>();
//  GlobalKey<NavigatorState> navigatorKey;
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> generateOtp(credentials) async {
    const url = '/user/generate-otp/';
    try {
      Map payload = {
        'phone': credentials['username'],
        'app_signature': credentials['app_signature']
      };
      var response = await _helper.post(url: url, data: payload);
      return response;
    } catch (error) {
      throw(error);
    }
  }

  Future<dynamic> authenticate(credentials) async {
    const url = '/user/admin-token/';

    var response = await _helper.post(url: url, data: {
      'name': credentials['username'],
      'password': credentials['password'],
    });
    print("credentials$credentials");
    return response;
  }
//  get(key){
//    navigatorKey = key;
//  }

  logout() {
    storageService.setValidationToken('');
    storageService.setIsLoggedIn(false);
    navigatorKey.currentState.pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

}