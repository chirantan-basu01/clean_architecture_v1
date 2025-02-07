import 'package:dio/dio.dart';
import '../../domain/entities/user.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  Future<List<User>> getUsers() async {
    try {
      final response =
      await dio.get('https://jsonplaceholder.typicode.com/users');
      final List<dynamic> jsonData = response.data;
      return jsonData.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

}
