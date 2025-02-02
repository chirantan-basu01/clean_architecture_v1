import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../features/users/data/datasources/user_remote_data_source.dart';
import '../features/users/data/repositories/user_repository_impl.dart';
import '../features/users/domain/repositories/user_repository.dart';
import '../features/users/domain/usecases/get_users.dart';
import '../features/users/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => UserBloc(getUsers: sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton(() => Dio());
}
