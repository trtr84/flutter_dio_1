import 'package:dio/dio.dart';
import 'package:flutter_dio_1/models/photos_model.dart';

class PhotosData {
  final Dio dio = Dio();
  Future<List<Photos>> getPhotos() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');
    try {
      if (response.statusCode == 200) {
        List<Photos> photos = (response.data as List).map((e) {
          return Photos.fromJson(e);
        }).toList();
        return photos;
      } else {
        throw Exception('An error has occurred');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
