import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/state.dart';
import 'package:flutter_clean_architecture/data/datasources/movies_local_data_source.dart';
import 'package:flutter_clean_architecture/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_clean_architecture/domain/entities/movie.dart';
import 'package:flutter_clean_architecture/domain/entities/people.dart';
import 'package:flutter_clean_architecture/domain/repositories/movies_repository.dart';
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
