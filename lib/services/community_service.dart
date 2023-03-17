import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecoplants/model/community.dart';
import 'package:ecoplants/utils.dart';

class CommunityService {
  final dio = Dio();

  Future<List<Community>> getCommunityList() async {
    dio.options.contentType = 'application/json';
    List<Community> list = [];
    try {
      final response = await dio.get('${Utils.baseUrl}/communities');
      if (response.data != null && response.data['status'] == 'success') {
        list = List<Community>.from((response.data['data']['community'] as List)
            .map((e) => Community.fromJson(e)));
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }

  Future<bool> createCommunity(String name, String email, String phone,
      String description, File picture, File document) async {
    dio.options.contentType = 'application/json';
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'phone': phone,
      'description': description,
      'picture': await MultipartFile.fromFile(
        picture.path,
      ),
      'document': await MultipartFile.fromFile(
        document.path,
      ),
    });

    try {
      final response =
          await dio.post('${Utils.baseUrl}/community/', data: formData);
      if (response.data != null && response.data['status'] == 'success') {
        return true;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }
}
