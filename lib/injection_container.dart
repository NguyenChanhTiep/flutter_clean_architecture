import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie_dp/data/datasources/movies_local_data_source.dart';
import 'package:flutter_movie_dp/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_movie_dp/data/repositories/movies_repository_impl.dart';
import 'package:flutter_movie_dp/domain/repositories/movies_repository.dart';
import 'package:flutter_movie_dp/domain/usecases/get_movies_popular.dart';
import 'package:flutter_movie_dp/domain/usecases/get_popular_actors.dart';
import 'package:flutter_movie_dp/pages/movies_list/bloc/movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => MoviesBloc(
      getPopularMovies: sl(),
      getPopularActors: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => GetPopularActors(sl()));

  // Repository
  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<MoviesLocalDataSource>(
    () => MoviesLocalDataSourceImpl(),
  );

  // Http client
  sl.registerLazySingleton(
    () => http.Client(),
  );
}
