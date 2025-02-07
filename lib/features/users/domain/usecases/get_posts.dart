import 'package:clean_architecture/features/users/domain/repositories/posts_repository.dart';

import '../entities/posts.dart';
import '../repositories/posts_repository.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Posts>> call() async {
    return await repository.getPosts();
  }
}
