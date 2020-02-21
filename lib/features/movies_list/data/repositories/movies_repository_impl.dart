import 'package:dartz/dartz.dart';
import 'package:flutter_movie_dp/core/error/exception.dart';
import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/features/movies_list/data/datasources/movies_local_data_source.dart';
import 'package:flutter_movie_dp/features/movies_list/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/repositories/movies_repository.dart';
import 'package:meta/meta.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;

  MoviesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<People>>> getPopularActors() async {
    try {
      final result = await remoteDataSource.getPopularActors();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.message));
    }
  }
}