import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';

abstract class MoviesRepository {
  Future<State<List<Movie>, Failure>> getPopularMovies();

  Future<State<List<People>, Failure>> getPopularActors();
}
