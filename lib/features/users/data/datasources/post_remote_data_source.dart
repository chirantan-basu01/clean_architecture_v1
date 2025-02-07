import 'package:dio/dio.dart';

import '../../domain/entities/posts.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource({required this.dio});

  Future<List<Posts>> getPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      final List<dynamic> jsonData = response.data;
      return jsonData.map((post) => Posts.fromJson(post)).toList();
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
