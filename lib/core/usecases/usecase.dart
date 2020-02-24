import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';

abstract class UseCase<Type, Params> {
  Future<State<Type, Failure>> call(Params params);
}

class NoParams {}