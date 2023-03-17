import 'package:dio/dio.dart';
import 'package:ecoplants/model/cart.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:get/get.dart';

class CartService {
  final dio = Dio();
  Future<bool> addToCart(int productId) async {
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response = await dio
          .post('${Utils.baseUrl}/cart/add/', data: {'product_id': productId});
      if (response.data != null && response.data['status'] == 'success') {
        return true;
      } else {
        Get.showSnackbar(Utils.getSnackBar(response.data['message']));
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }

  Future<List<Cart>> getAllCart() async {
    List<Cart> list = [];
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response = await dio.get(Utils.baseUrl);
      if (response.data != null) {
        final jsonList = response.data['items'] as List;
        list = List.from(jsonList.map((e) => Cart.fromJson(e)));
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }

  Future<bool> removeCartItem(int id) async {
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response =
          await dio.delete('${Utils.baseUrl}/cart/delete/?product_id=$id');
      if (response.data != null && response.data['status'] == 'success') {
        return true;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }
}
