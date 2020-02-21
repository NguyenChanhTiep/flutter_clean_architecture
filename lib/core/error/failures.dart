import 'package:meta/meta.dart';

class Failure {
  String message;

  Failure({@required this.message});

  @override
  String toString() {
    return "Failure: ${message ?? "unknow"}";
  }
}

class ServerFailure extends Failure {
  String message;

  ServerFailure({@required this.message}): super(message: message);
}

class CacheFailure extends Failure {
  String message;

  CacheFailure({@required this.message}): super(message: message);
}