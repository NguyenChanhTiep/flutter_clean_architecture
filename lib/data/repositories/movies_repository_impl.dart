import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/state.dart';
import 'package:flutter_movie_dp/data/datasources/movies_local_data_source.dart';
import 'package:flutter_movie_dp/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_movie_dp/domain/entities/movie.dart';
import 'package:flutter_movie_dp/domain/entities/people.dart';
import 'package:flutter_movie_dp/domain/repositories/movies_repository.dart';
import 'package:meta/meta.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;

  MoviesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<State<List<Movie>, Failure>> getPopularMovies() =>
      remoteDataSource.getPopularMovies();

  @override
  Future<State<List<People>, Failure>> getPopularActors() {
    // TODO: implement getPopularActors
    return null;
  }
}
