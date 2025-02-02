import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/users');
      final List<dynamic> jsonData = response.data;
      return jsonData.map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}
