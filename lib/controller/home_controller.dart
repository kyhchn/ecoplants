import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find();
  final searchController = TextEditingController();
  final index = 0.obs;
  final isLoading = false.obs;
  var listReccomendedProduct = <Product>[].obs;
  var listPopularProduct = <Product>[].obs;

  @override
  void onInit() {
    fetchAllProduct();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> fetchAllProduct() async {
    isLoading(true);
    final list = await ProductService().getAllProduct(20, 1);
    listPopularProduct.value = list.sublist(0, 5);
    listReccomendedProduct.value = list.sublist(5);
    isLoading(false);
  }
}
