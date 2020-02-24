import 'dart:convert';

import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/features/movies_list/data/models/movie_model.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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
    final response = await client.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=8ec3fbf1c1b06d940e29c592421917ae&language=en-US&page=1');
    if (response.statusCode == 200) {
      final movies = (json.decode(response.body)["results"] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return State.success(movies);
    } else {
      final failure = ServerFailure(
          message: json.decode(response.body)['status_message'],
          code: response.statusCode);
      return State.error(failure);
    }
  }
}
