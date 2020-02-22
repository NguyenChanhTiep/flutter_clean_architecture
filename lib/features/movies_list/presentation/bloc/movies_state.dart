import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:meta/meta.dart';

abstract class MoviesState {}

class Empty extends MoviesState {}

class LoadingMovies extends MoviesState {}

class LoadedMovies extends MoviesState {
  final List<Movie> movies;

  LoadedMovies({@required this.movies});
}

class ErrorLoadMovies extends MoviesState {

  final String message;

  ErrorLoadMovies({@required this.message});
}
