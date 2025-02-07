import 'package:clean_architecture/features/users/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture/features/users/domain/repositories/posts_repository.dart';

import '../../domain/entities/posts.dart';

class PostsRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Posts>> getPosts() async {
    try {
      return await remoteDataSource.getPosts();
    } catch (e) {
      throw Exception('Error fetching posts');
    }
  }
}