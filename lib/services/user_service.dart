import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecoplants/model/user.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';

class UserService {
  final dio = Dio();
  Future<User?> getUserById() async {
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response = await dio.get('${Utils.baseUrl}/user/bearer');
      if (response.data != null && response.data['status'] == 'success') {
        return User.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<bool> updateImageProfile(File file) async {
    try {
      FormData formData = FormData.fromMap(
          {'picture': await MultipartFile.fromFile(file.path)});
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response =
          await dio.put('${Utils.baseUrl}/user/update/picture/', data: formData);
      if (response.data != null && response.data['status'] == 'success') {
        return true;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }
}
