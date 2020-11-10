import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/data/models/movie.dart';
import 'package:flutter_clean_architecture/data/models/people.dart';

abstract class MoviesRepository {
  Future<State<List<Movie>, Failure>> getPopularMovies();

  Future<State<List<People>, Failure>> getPopularActors();
}
