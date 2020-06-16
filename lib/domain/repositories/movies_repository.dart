import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/domain/entities/movie.dart';
import 'package:flutter_clean_architecture/domain/entities/people.dart';

abstract class MoviesRepository {
  Future<State<List<Movie>, Failure>> getPopularMovies();

  Future<State<List<People>, Failure>> getPopularActors();
}
