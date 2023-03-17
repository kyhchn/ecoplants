import 'package:ecoplants/model/transaction.dart';
import 'package:ecoplants/services/transaction_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetailController extends GetxController {
  static PaymentDetailController get i => Get.find();

  final index = 0.obs;
  final informationIsValid = false.obs;
  final shippingIsValid = false.obs;
  final paymentIsValid = false.obs;
  final nameController = TextEditingController();
  final telpNumberController = TextEditingController();
  final provinceController = TextEditingController();
  final cityAndSubDistrictController = TextEditingController();
  final postalCodeController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();
  final paymentMethod = ''.obs;
  Rx<int> shippingMethod = 4.obs;
  final isLoading = false.obs;
  final listShippingMethod = <ShippingMethod>[
    ShippingMethod(company: 'JNE Regular', price: 18000, maxDay: 5, minDay: 3),
    ShippingMethod(company: 'J&T Express', price: 20000, maxDay: 5, minDay: 3),
    ShippingMethod(
        company: 'Sicepat Ekonomi', price: 12000, maxDay: 7, minDay: 5),
  ];

  @override
  void dispose() {
    nameController.dispose();
    telpNumberController.dispose();
    provinceController.dispose();
    cityAndSubDistrictController.dispose();
    postalCodeController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<Transaction?> checkOut(int quantity, int productId) async {
    isLoading(true);
    final transaction = await TransactionService().checkOut(
        paymentMethod.value, quantity, productId, shippingMethod.value);
    isLoading(false);
    return transaction;
  }

  void Function()? getOnPressedFunction(int quantity, int productId) {
    if (index.value == 0) {
      if (informationIsValid.value) {
        return () => index.value = 1;
      }
    } else if (index.value == 1) {
      if (shippingIsValid.value) {
        return () => index.value = 2;
      }
    } else if (index.value == 2) {
      if (paymentIsValid.value) {
        return () async {
          final transaction = await checkOut(quantity, productId);
          if (transaction != null) {
            index.value = 3;
          } else {
            Get.showSnackbar(Utils.getSnackBar('Gagal Melakukan Pembayaran'));
          }
        };
      }
    }
    return null;
  }

  void informationValidate() {
    informationIsValid.value = nameController.value.text.isNotEmpty &&
        telpNumberController.value.text.isNotEmpty &&
        provinceController.value.text.isNotEmpty &&
        cityAndSubDistrictController.value.text.isNotEmpty &&
        postalCodeController.value.text.isNotEmpty &&
        addressController.value.text.isNotEmpty;
  }

  void shippingValidate() {
    shippingIsValid.value = shippingMethod.value != 4;
  }

  void paymentValidate() {
    paymentIsValid.value = paymentMethod.value != '';
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
  String getEstimatedText() {
    return 'Estimasi $minDay - $maxDay Hari';
  }
}
