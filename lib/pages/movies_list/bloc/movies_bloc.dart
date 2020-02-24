import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_dp/core/usecases/usecase.dart';
import 'package:flutter_movie_dp/domain/usecases/get_movies_popular.dart';
import 'package:flutter_movie_dp/domain/usecases/get_popular_actors.dart';
import 'package:meta/meta.dart';

import 'package:flutter_movie_dp/pages/movies_list/bloc/movies_event.dart';
import 'package:flutter_movie_dp/pages/movies_list/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMovies getPopularMovies;
  final GetPopularActors getPopularActors;

  MoviesBloc({
    @required this.getPopularMovies,
    @required this.getPopularActors,
  });

  @override
  MoviesState get initialState => Empty();

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is GetPopularMoviesEvent) {
      final result = await getPopularMovies(NoParams());
      yield result.fold(
        (movies) => LoadedMovies(movies: movies),
        (error) => ErrorLoadMovies(message: error.message),
      );
    }
  }
}
