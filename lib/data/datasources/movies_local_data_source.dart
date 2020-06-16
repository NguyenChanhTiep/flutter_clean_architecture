import 'package:flutter_clean_architecture/domain/entities/movie.dart';
import 'package:flutter_clean_architecture/domain/entities/people.dart';

abstract class MoviesLocalDataSource {

  Future<List<People>> getPopularActors();

  Future<List<Movie>> getPopularMovies();
}

class MoviesLocalDataSourceImpl extends MoviesLocalDataSource {

  @override
  Future<List<People>> getPopularActors() {
    return null;
  }

  @override
  Future<List<Movie>> getPopularMovies() {
    return null;
  }
}