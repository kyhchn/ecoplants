import 'dart:ffi';

import 'package:ecoplants/model/donation_transaction.dart';
import 'package:ecoplants/services/donation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DonateController extends GetxController {
  static DonateController get i => Get.find();
  final amount = 0.obs;
  final index = 0.obs;
  final amountController = TextEditingController();
  final paymentMethod = ''.obs;
  final isSubmit = false.obs;

  void onCloseModal() {
    if (!isSubmit.value) {
      amount.value = 0;
      index.value = 0;
      amountController.clear();
      paymentMethod.value = '';
    }
  }

  int getPaymentMethod() {
    if (paymentMethod.value == 'BCA') {
      return 1;
    } else if (paymentMethod.value == 'BRI') {
      return 2;
    } else if (paymentMethod.value == 'BNI') {
      return 3;
    } else if (paymentMethod.value == 'MANDIRI') {
      return 4;
    } else {
      return 5;
    }
  }

  Future<DonationTransaction?> checkOut(int donationId) async {
    final data = await DonationService()
        .checkOut(donationId, amount.value, getPaymentMethod());
    return data;
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
