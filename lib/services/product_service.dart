import 'package:dio/dio.dart';
import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/utils.dart';

class ProductService {
  final dio = Dio();

  Future<List<Product>> getAllProductbyName(String target) async {
    List<Product> list = [];
    try {
      dio.options.contentType = 'application/json';
      final response =
          await dio.get("${Utils.baseUrl}/product/search/?name=$target");
      if (response.data != null) {
        for (var element in (response.data['data'] as List)) {
          list.add(Product.fromJson(element));
        }
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }

  Future<List<Product>> getAllProduct(int limit, int page) async {
    List<Product> list = [];
    try {
      dio.options.contentType = 'application/json';
      final response =
          await dio.get("${Utils.baseUrl}/products?page=$page&limit=$limit");
      if (response.data != null) {
        for (var element in (response.data['data'] as List<dynamic>)) {
          list.add(Product.fromJson(element));
        }
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }
}
