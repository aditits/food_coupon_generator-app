import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveIntToDisk(String key, int content) {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences.setInt(key, content);
  }

  void _saveBoolToDisk(String key, bool content) {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences.setBool(key, content);
  }

  void _saveStringToDisk(String key, String content) {
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    _preferences.setString(key, content);
  }

//-----------------------------------------------------------------------------------------------
//Methods for setting registeredPhoneNumber                                              |
//-----------------------------------------------------------------------------------------------
  static const String _registeredPhoneNumber = 'registeredPhoneNumber';

  String get registeredPhoneNumber {
    var _value = _getFromDisk(_registeredPhoneNumber);
    if (_value == null) {
      return null;
    }

    return _value;
  }

  void setRegisteredPhoneNumber(String phoneNumber) {
    _saveStringToDisk(_registeredPhoneNumber, phoneNumber);
  }


//-----------------------------------------------------------------------------------------------
//Methods for setting setIsLoggedIn                                            |
//-----------------------------------------------------------------------------------------------
  static const String _isLoggedIn = 'isLoggedIn';

  bool get isLoggedIn {
    var _value = _getFromDisk(_isLoggedIn);
    if (_value == null) {
      return false;
    }

    return _value;
  }

  void setIsLoggedIn(bool status) {
    _saveBoolToDisk(_isLoggedIn, status);
  }



//-----------------------------------------------------------------------------------------------
//Methods for setting validation token                                      |
//-----------------------------------------------------------------------------------------------
  static const String _validationToken = 'customervalidationToken';

  get validationToken {
    var _value = _getFromDisk(_validationToken);
    if (_value == null) {
      return null;
    }

    return _value;
  }

  void setValidationToken(String token) {
    _saveStringToDisk(_validationToken, token);
  }

  //-----------------------------------------------------------------------------------------------
//Methods for setting validation token                                      |
//-----------------------------------------------------------------------------------------------
  static const String _userTpe = 'userType';



  void setUserType(int userType) {
    _saveIntToDisk(_userTpe, userType);
  }
  //--------------------------

  get userType {
    var _value = _getFromDisk(_userTpe);
    if (_value == null) {
      return 3;
    }

    return _value;
  }




//-----------------------------------------------------------------------------------------------
}
