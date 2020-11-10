import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/data/models/movie.dart';
import 'package:flutter_clean_architecture/data/models/people.dart';
import 'package:meta/meta.dart';

import 'api_service/api_base.dart';
import 'api_service/requests/requests.dart';

abstract class MoviesRemoteDataSource {
  Future<List<People>> getPopularActors();

  Future<State<List<Movie>, Failure>> getPopularMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final ApiService apiService;

  MoviesRemoteDataSourceImpl({@required this.apiService});

  @override
  Future<List<People>> getPopularActors() {
    // TODO: implement getPopularActors
    return null;
  }

  @override
  Future<State<List<Movie>, Failure>> getPopularMovies() async {
    final request =
        GetPopularMoviesRequest(apiKey: '8ec3fbf1c1b06d940e29c592421917ae');
    final result = apiService.request<List<Movie>>(
        request: request,
        mapper: (json) {
          final movies = (json["results"] as List)
              .map((json) => Movie.fromJson(json))
              .toList();
          return movies;
        });
    return result;
  }
}
