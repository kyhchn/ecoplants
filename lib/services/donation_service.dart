import 'package:dio/dio.dart';
import 'package:ecoplants/model/donation.dart';
import 'package:ecoplants/model/donation_transaction.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:get_storage/get_storage.dart';

class DonationService {
  final dio = Dio();
  Future<List<Donation>> getAllDonation() async {
    dio.options.contentType = 'application/json';
    List<Donation> list = [];
    try {
      final response = await dio.get('${Utils.baseUrl}/donations');
      if (response.data != null && response.data['status'] == 'success') {
        list = List<Donation>.from((response.data['data']['donation'] as List)
            .map((e) => Donation.fromJson(e)));
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }

  Future<DonationTransaction?> checkOut(
      int donationId, int nominal, int paymentMethod) async {
    dio.options.contentType = 'application/json';
    dio.options.headers['authorization'] =
        'Bearer ${CacheService.storage.read('token')}';
    try {
      final response = await dio.post('${Utils.baseUrl}/user/donation/', data: {
        "donation_id": donationId,
        "nominal": nominal,
        "payment_method": paymentMethod
      });

      if (response.data != null && response.data['status'] == 'success') {
        return DonationTransaction.fromJson(response.data['data']);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<List<DonationTransaction>> getlistDonationTransaction() async {
    List<DonationTransaction> list = [];
    dio.options.contentType = 'application/json';
    dio.options.headers['authorization'] =
        'Bearer ${CacheService.storage.read('token')}';
    try {
      final response = await dio.get('${Utils.baseUrl}/user/donations');
      if (response.data != null && response.data['status'] == 'success') {
        list = List<DonationTransaction>.from((response.data['data'] as List)
            .map((e) => DonationTransaction.fromJson(e)));
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return list;
  }
}
