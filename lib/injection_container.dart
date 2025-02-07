import 'package:clean_architecture/features/users/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../features/users/data/datasources/user_remote_data_source.dart';
import '../features/users/data/repositories/user_repository_impl.dart';
import '../features/users/domain/repositories/user_repository.dart';
import '../features/users/domain/usecases/get_users.dart';
import '../features/users/presentation/bloc/user_bloc.dart';
import 'features/users/data/datasources/post_remote_data_source.dart';
import 'features/users/data/repositories/post_repository_impl.dart';
import 'features/users/domain/usecases/get_posts.dart';
import 'features/users/presentation/bloc/posts_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => UserBloc(getUsers: sl()));
  sl.registerFactory(() => PostsBloc(getPosts: sl()));


  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => GetPosts(sl()));


  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<PostRepository>(() => PostsRepositoryImpl(remoteDataSource: sl()));


  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(dio: sl()));
  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSource(dio: sl()));


  sl.registerLazySingleton(() => Dio());

}
