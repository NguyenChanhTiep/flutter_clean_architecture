import 'package:flutter_movie_dp/domain/entities/movie.dart';
import 'package:flutter_movie_dp/domain/entities/people.dart';

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