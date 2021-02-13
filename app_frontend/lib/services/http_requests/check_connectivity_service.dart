//Use dart.io for lookup method.
import 'dart:io';

class CheckConnectivity {
  static Future<bool> checkConnectivity() async {
    bool connect;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty && result !=null) {
        print('here');
        print(result);
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }
}