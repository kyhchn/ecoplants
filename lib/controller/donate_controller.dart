import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DonateController extends GetxController {
  static DonateController get i =>Get.find();
  final amount = 0.obs;
  final amountController = TextEditingController();
}
