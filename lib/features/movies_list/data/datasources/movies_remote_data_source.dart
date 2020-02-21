import 'package:flutter_movie_dp/core/error/exception.dart';
import 'package:flutter_movie_dp/features/movies_list/data/models/movie_model.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<List<People>> getPopularActors();

  Future<List<Movie>> getPopularMovies();
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
  Future<List<Movie>> getPopularMovies() async {
    final response = await client.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=8ec3fbf1c1b06d940e29c592421917ae&language=en-US&page=1');
    if (response.statusCode == 200) {
      final movies = (json.decode(response.body)["results"] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return movies;
    } else {
      throw ServerException.fromJson(json.decode(response.body));
    }
  }
}
