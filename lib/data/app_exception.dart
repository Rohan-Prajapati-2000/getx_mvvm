class AppException implements Exception{
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString(){
    return '$_message $_prefix';
  }
}

class InternetException extends AppException{
  InternetException([String? message]) : super("",'No Internet');
}

class ReqTimeoutException extends AppException{
  ReqTimeoutException([String? message]) : super(message, "Request Timeout");
}

class ServerException extends AppException{
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppException{
  InvalidUrlException([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, "");
}