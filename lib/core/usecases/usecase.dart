import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';

abstract class UseCase<Type, Params> {
  Future<State<Type, Failure>> call(Params params);
}

class NoParams {}