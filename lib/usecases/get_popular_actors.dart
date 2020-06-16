import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture/data/models/people.dart';
import 'package:flutter_clean_architecture/data/repositories/movies_repository.dart';

class GetPopularActors extends UseCase<List<People>, NoParams> {
  final MoviesRepository repository;

  GetPopularActors(this.repository);

  @override
  Future<State<List<People>, Failure>> call(NoParams params) {
    return repository.getPopularActors();
  }
}
