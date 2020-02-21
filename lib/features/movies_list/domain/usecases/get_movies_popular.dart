import 'package:dartz/dartz.dart';
import 'package:flutter_movie_dp/core/error/failures.dart';
import 'package:flutter_movie_dp/core/usecases/usecase.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/entities/movie.dart';
import 'package:flutter_movie_dp/features/movies_list/domain/repositories/movies_repository.dart';

class GetPopularMovies extends UseCase<List<Movie>, NoParams> {
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return repository.getPopularMovies();
  }
}