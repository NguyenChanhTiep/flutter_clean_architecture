import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture/data/models/movie.dart';
import 'package:flutter_clean_architecture/data/repositories/movies_repository.dart';

class GetPopularMovies extends UseCase<List<Movie>, NoParams> {
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<State<List<Movie>, Failure>> call(NoParams params) {
    return repository.getPopularMovies();
  }
}
