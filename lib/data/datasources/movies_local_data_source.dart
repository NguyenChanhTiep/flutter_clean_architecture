import 'package:flutter_clean_architecture/data/models/movie.dart';
import 'package:flutter_clean_architecture/data/models/people.dart';

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
