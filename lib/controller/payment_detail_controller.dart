// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetailController extends GetxController {
  static PaymentDetailController get i => Get.find();

  final index = 0.obs;
  final isValid = false.obs;
  final nameController = TextEditingController();
  final telpNumberController = TextEditingController();
  final provinceController = TextEditingController();
  final cityAndSubDistrictController = TextEditingController();
  final postalCodeController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();
  Rx<ShippingMethod?> shippingMethod =
      ShippingMethod(company: 'JNE Reguler', price: 18000, maxDay: 5, minDay: 3)
          .obs;

  @override
  void dispose() {
    index.close();
    isValid.close();
    nameController.dispose();
    telpNumberController.dispose();
    provinceController.dispose();
    cityAndSubDistrictController.dispose();
    postalCodeController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void validate() {
    isValid.value = nameController.value.text.isNotEmpty &&
        telpNumberController.value.text.isNotEmpty &&
        provinceController.value.text.isNotEmpty &&
        cityAndSubDistrictController.value.text.isNotEmpty &&
        postalCodeController.value.text.isNotEmpty &&
        addressController.value.text.isNotEmpty;
  }
}

class ShippingMethod {
  String company;
  int minDay, maxDay, price;
  ShippingMethod(
      {required this.company,
      required this.price,
      required this.maxDay,
      required this.minDay});
}
