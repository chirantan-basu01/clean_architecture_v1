import '../entities/posts.dart';

abstract class PostRepository {
  Future<List<Posts>> getPosts();
}
