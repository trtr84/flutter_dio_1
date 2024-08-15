import 'package:dio/dio.dart';
import 'package:flutter_dio_1/models/users_model.dart';

class UsersGetData {
  final Dio dio = Dio();
  Future<List<Users>> getUsers() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    try {
      if (response.statusCode == 200) {
        List<Users> users = (response.data as List).map((e) {
          return Users.fromJson(e);
        }).toList();
        return users;
      } else {
        throw Exception('An error has occurred');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
