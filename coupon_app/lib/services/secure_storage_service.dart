//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
//class SecureStorageService {
//  static FlutterSecureStorage _instance;
//
//  static Future<FlutterSecureStorage> getInstance() async {
//    if (_instance == null) {
//     final  _instance = FlutterSecureStorage();
//    }
//
//    return _instance;
//  }
//  dynamic _getFromDisk(String key) async{
//    var value = await _instance.read(key:key);
//    print('(TRACE) Secure storage:_getFromDisk. key: $key value: $value');
//    return value;
//  }
//
//  _writeToDisk(String key, value) async{
//    await _instance.write(key:key, value: value);
//    print('(TRACE) securee storage :wrtiting to disk. key: $key value: $value');
//  }
//
//
//  //-----------------------------------------------------------------------------------------------
////Methods for setting Token                                      |
////-----------------------------------------------------------------------------------------------
//  static const String _token = 'token';
//
//  String get token {
//    var _value = _getFromDisk(_token);
//    if (_value == null) {
//      return '';
//    }
//
//    return _value;
//  }
//
//  void setToken(String token) {
//    _writeToDisk(_token, token);
//  }
//
//
//}