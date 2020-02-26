import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/data/models/movie_model.dart';
import 'package:flutter_movie_dp/domain/entities/movie.dart';
import 'package:flutter_movie_dp/domain/entities/people.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'api_service/api_base.dart';
import 'api_service/requests/requests.dart';

abstract class MoviesRemoteDataSource {
  Future<List<People>> getPopularActors();

  Future<State<List<Movie>, Failure>> getPopularMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final http.Client client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<People>> getPopularActors() {
    // TODO: implement getPopularActors
    return null;
  }

  @override
  Future<State<List<Movie>, Failure>> getPopularMovies() async {
    final apiService = ApiService();
    final request =
        GetPopularMoviesRequest(apiKey: '8ec3fbf1c1b06d940e29c592421917ae');
    final result = apiService.request<List<MovieModel>>(
        request: request,
        convertJsonToObject: (json) {
          final movies = (json["results"] as List)
              .map((json) => MovieModel.fromJson(json))
              .toList();
          return movies;
        });
    return result;
  }
}
