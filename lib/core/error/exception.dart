import 'package:meta/meta.dart';

class ServerException implements Exception {
  final String message;
  final int code;

  ServerException({@required this.message, @required this.code});

  factory ServerException.fromJson(Map<String, dynamic> json) {
    return ServerException(message: json["status_message"], code: json["status_code"]);
  }

  @override
  String toString() {
    return message == null ? "ServerException" : "ServerException: $message";
  }
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() {
    return message == null ? "CacheException" : "CacheException: $message";
  }
}