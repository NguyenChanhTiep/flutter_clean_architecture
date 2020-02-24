import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/core/usecases/usecase.dart';
import 'package:flutter_movie_dp/domain/entities/movie.dart';
import 'package:flutter_movie_dp/domain/repositories/movies_repository.dart';

class GetPopularMovies extends UseCase<List<Movie>, NoParams> {
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<State<List<Movie>, Failure>> call(NoParams params) {
    return repository.getPopularMovies();
  }
}
