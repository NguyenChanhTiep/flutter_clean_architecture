import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/core/usecases/usecase.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/repositories/movies_repository.dart';

class GetPopularActors extends UseCase<List<People>, NoParams> {
  final MoviesRepository repository;

  GetPopularActors(this.repository);

  @override
  Future<State<List<People>, Failure>> call(NoParams params) {
    return repository.getPopularActors();
  }
}
