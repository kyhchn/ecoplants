import 'package:dio/dio.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';

class AuthService {
  final dio = Dio();

  Future<bool> login(String emailorUsername, String password) async {
    dio.options.headers['Content-Type'] = 'application/json';
    try {
      final response = await dio.post("${Utils.baseUrl}/login",
          data: {'username/email': emailorUsername, 'password': password});
      final token = response.data['data']['token'];
      if (token != null) {
        await CacheService.storage.write('token', token);
        return true;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }

  Future<bool> register(
      String name, String email, String username, String password) async {
    try {
      final response = await dio.post("${Utils.baseUrl}/register", data: {
        'name': name,
        'email': email,
        'username': username,
        'password': password
      });

      if (response.data != null && response.data['status'] == 'success') {
        bool canLogin = await login(email, password);
        return canLogin;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }
}
