import 'package:ecoplants/model/donation.dart';
import 'package:ecoplants/model/donation_transaction.dart';
import 'package:ecoplants/services/donation_service.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  static DonationController get i => Get.find();
  final isLoading = false.obs;
  var listDonation = <Donation>[].obs;
  var listDonationTransaction = <DonationTransaction>[].obs;
  final index = 0.obs;

  Future<void> fetchListDonationTransaction() async {
    isLoading(true);
    final data = await DonationService().getlistDonationTransaction();
    listDonationTransaction = data.obs;
    isLoading(false);
  }

  Future<void> fetchListDonation() async {
    isLoading(true);
    final data = await DonationService().getAllDonation();
    listDonation = data.obs;
    isLoading(false);
  }

  @override
  void onInit() {
    fetchListDonation();
    fetchListDonationTransaction();
    super.onInit();
  }
}
