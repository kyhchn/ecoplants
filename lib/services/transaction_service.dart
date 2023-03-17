import 'package:dio/dio.dart';
import 'package:ecoplants/model/transaction.dart';
import 'package:ecoplants/utils.dart';

import 'cache_service.dart';

class TransactionService {
  final dio = Dio();
  Future<bool> updateShippingAddress(
      String recipient,
      String phone,
      String province,
      String regencyDistrict,
      String home,
      int postalCode) async {
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response =
          await dio.put('${Utils.baseUrl}/transaction/shipping/', data: {
        "recipient": recipient,
        "phone": phone,
        "province": province,
        "regency_district": regencyDistrict,
        "home": home,
        "postal_code": postalCode
      });
      if (response.data != null && response.data['status'] == 'success') {
        return true;
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return false;
  }

  Future<Transaction?> checkOut(String paymentMethod, int quantity,
      int productId, int shippingMethod) async {
    try {
      dio.options.contentType = 'application/json';
      dio.options.headers['authorization'] =
          'Bearer ${CacheService.storage.read('token')}';
      final response = await dio.post('${Utils.baseUrl}/transaction/', data: {
        "product_id": productId,
        "quantity": quantity,
        "payment_method": getPaymentMethod(paymentMethod),
        "shipping_method": shippingMethod
      });
      if (response.data != null && response.data['status'] == 'success') {
        return Transaction.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  

  int getPaymentMethod(String paymentMethod) {
    if (paymentMethod == 'BCA') {
      return 1;
    } else if (paymentMethod == 'BRI') {
      return 2;
    } else {
      return 3;
    }
  }
}
