import 'package:meta/meta.dart';

abstract class Failure {
  const Failure(String message) : this.message = message;
  final String message;

  @override
  String toString() {
    return 'Failure: $message';
  }
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({
    @required String message,
    @required this.code,
  }) : super(message);

  final int code;

  @override
  String toString() {
    return 'Failure with code: $code, message: $message';
  }
}

class CacheFailure extends Failure {
  CacheFailure({@required String message}) : super(message);
}
