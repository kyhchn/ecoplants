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

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
