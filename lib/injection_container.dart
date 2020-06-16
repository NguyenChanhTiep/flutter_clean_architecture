import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_clean_architecture/data/datasources/movies_local_data_source.dart';
import 'package:flutter_clean_architecture/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_clean_architecture/data/repositories/movies_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/repositories/movies_repository.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_movies_popular.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_popular_actors.dart';
import 'package:flutter_clean_architecture/pages/movies_list/bloc/movies_bloc.dart';

import 'data/datasources/api_service/api_base.dart';

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
    () => MoviesRemoteDataSourceImpl(apiService: sl()),
  );

  sl.registerLazySingleton<MoviesLocalDataSource>(
    () => MoviesLocalDataSourceImpl(),
  );

  // Http client
  sl.registerLazySingleton(
    () => http.Client(),
  );

  // API Service
  sl.registerLazySingleton(() => ApiService(dio: sl()));
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')));
}