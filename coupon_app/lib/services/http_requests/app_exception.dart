class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException{
  FetchDataException([String message])
  : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException{
  BadRequestException([message])
  : super(message, "Bad Request : ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class AlreadyExistsException extends AppException {
  AlreadyExistsException([String message]) : super(message, "Already exists: ");
}