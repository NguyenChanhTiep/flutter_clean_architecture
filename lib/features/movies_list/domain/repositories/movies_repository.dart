import 'package:dartz/dartz.dart';
import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/people.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<People>>> getPopularActors();
}