import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart' as asy;
import 'package:coupon_app/providers/authentication_provider.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'package:path/path.dart';

import '../localstorage_service.dart';
import '../service_locator.dart';
import 'app_exception.dart';

class ApiBaseHelper {
  static var storageService = locator<LocalStorageService>();
  String token = storageService.validationToken;


  fetchToken(){
    if(token==null|| token =='') {
      token = storageService.validationToken;
    }
  }

//  static final String baseUrl = 'http://192.168.1.107:8000';
//  static final String baseUrl = 'http://192.168.56.1:8000';
//  static final String baseUrl = 'http://192.168.1.107:8000';
  static final String baseUrl = 'http://10.0.2.2:8000';

  Future<dynamic> post({String url, data: null}) async {
    final _targetUrl = baseUrl + url;
    fetchToken();
    print(_targetUrl);
    print(token);
    var responseJson;
    Uri uri = Uri.parse(_targetUrl);
    try {
      if (data != null) {
        print(data);
        String params = json.encode(data);
        final response = await http.post(uri, body: params, headers: {
          'content-type': 'application/json',
          'Authorization': token
        });
        print(response.statusCode);
        responseJson = _returnResponse(response);
      } else {
        final response = await http.post(uri, headers: {
          'content-type': 'application/json',
          'Authorization': token
        });
        print(response.statusCode);
        responseJson = _returnResponse(response);
      }
    } on SocketException {
      print('Socket Exception');
      throw FetchDataException('No Internet Connection');
    }
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> get({String url, data}) async {
    var responseJson;
    final _targetUrl = baseUrl + url;
    fetchToken();
    print(_targetUrl);
    print(token);
    Uri uri = Uri.parse(_targetUrl);
    if (data != null) {
      final newURI = uri.replace(queryParameters: data);
      uri = newURI;
      print(token);
      final response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization': token
      });
      print(response.statusCode);
      responseJson = _returnResponse(response);
      return responseJson;
    } else {
      final response = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization': token
      });
      print(response.statusCode);
      responseJson = _returnResponse(response);
      print(responseJson);
      return responseJson;
    }
  }

  Future<dynamic> put({String url, data: null}) async {
    final _targetUrl = baseUrl + url;
    fetchToken();
    print(_targetUrl);
    var responseJson;
    Uri uri = Uri.parse(_targetUrl);
    try {
      if (data != null) {
        String params = json.encode(data);
        final response = await http.put(uri, body: params, headers: {
          'content-type': 'application/json',
          'Authorization': token
        });
        print(response.statusCode);
        responseJson = _returnResponse(response);
      } else {
        final response = await http.put(uri, headers: {
          'content-type': 'application/json',
          'Authorization': token
        });
        print(response.statusCode);
        responseJson = _returnResponse(response);
      }
    } on SocketException {
      print('Socket Exception');
      throw FetchDataException('No Internet Connection');
    }
    print(responseJson);
    return responseJson;
  }

  Future<dynamic> uploadImage({String url, imageFile}) async {
    final _targetUrl = baseUrl + url;
    fetchToken();
    print(_targetUrl);
    var responseJson;
    Uri uri = Uri.parse(_targetUrl);
    try {
      if (imageFile != null) {
        var stream =
            http.ByteStream(asy.DelegatingStream.typed(imageFile.openRead()));
        var length = await imageFile.length();

        var request = new http.MultipartRequest("POST", uri);

        var multipartFile = http.MultipartFile('dish_image', stream, length,
            filename: basename(imageFile.path));

        request.files.add(multipartFile);
        Map<String, String> headers = {"Authorization": token};
        request.headers.addAll(headers);
        var response = await request.send();
        return response;


      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
//    print(responseJson);
//    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body);
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body);
      return responseJson;

    case 400:
      var responseJson = json.decode(response.body);
      print(responseJson);
      throw BadRequestException(responseJson['message']);
    case 404:
      var responseJson = json.decode(response.body);
      print(responseJson);

      throw InvalidInputException(responseJson['message']);
    case 401:
      var responseJson = json.decode(response.body);
      print('here----------------------');
      print(responseJson);
      showToast('Unauthorized');
      AuthenticationProvider().logout();
      throw UnauthorisedException('Unauthorized');
    case 403:
      var responseJson = json.decode(response.body);
      print(responseJson);
      throw UnauthorisedException('Unauthorized');
    case 409:
      var responseJson = json.decode(response.body);
      print(responseJson);

      throw AlreadyExistsException(responseJson['message']);

    default:
      throw FetchDataException(
          'Error occurred while communicating with server[Error Code :${response.statusCode}:');
  }
}
