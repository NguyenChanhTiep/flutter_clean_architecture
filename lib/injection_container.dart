import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/movies_list/data/datasources/movies_local_data_source.dart';
import 'features/movies_list/data/datasources/movies_remote_data_source.dart';
import 'features/movies_list/data/repositories/movies_repository_impl.dart';
import 'features/movies_list/domain/repositories/movies_repository.dart';
import 'features/movies_list/domain/usecases/get_movies_popular.dart';
import 'features/movies_list/domain/usecases/get_popular_actors.dart';
import 'features/movies_list/presentation/bloc/movies_bloc.dart';

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
