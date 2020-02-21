import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';

abstract class MoviesLocalDataSource {

  Future<List<People>> getPopularActors() {
    return null;
  }

  Future<List<Movie>> getPopularMovies() {
    return null;
  }
}