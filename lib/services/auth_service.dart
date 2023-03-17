import 'package:dio/dio.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:get/get.dart';

class AuthService {
  final dio = Dio();

  Future<bool> login(String emailorUsername, String password) async {
    dio.options.contentType = 'application/json';
    try {
      final response = await dio.post("${Utils.baseUrl}/user/login/",
          data: {'username/email': emailorUsername, 'password': password});
      final token = response.data['data']['token'];
      if (token != null) {
        await CacheService.storage.write('token', token);
        return true;
      } else {
        final message = response.data['message'];
        Get.showSnackbar(GetSnackBar(
          message: message,
          duration: const Duration(seconds: 2),
        ));
      }
    } on DioError catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.message,
        duration: const Duration(seconds: 2),
      ));
    }
    return false;
  }

  Future<bool> register(
      String name, String email, String username, String password) async {
    try {
      dio.options.contentType = 'application/json';
      final response = await dio.post("${Utils.baseUrl}/user/register/", data: {
        'name': name,
        'email': email,
        'username': username,
        'password': password
      });

      if (response.data != null && response.data['status'] == 'success') {
        bool canLogin = await login(email, password);
        return canLogin;
      } else {
        final message = response.data['message'];
        Get.showSnackbar(GetSnackBar(
          message: message,
          duration: const Duration(seconds: 2),
        ));
      }
    } on DioError catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.message,
        duration: const Duration(seconds: 2),
      ));
    }
    return false;
  }
}
