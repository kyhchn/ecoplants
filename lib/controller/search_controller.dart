// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get i => Get.find();
  String str;
  SearchController({
    required this.str,
  });
  final searchController = TextEditingController();
  final isProduct = true.obs;
  final isLoading = false.obs;
  var products = <Product>[].obs;
  @override
  void onInit() {
    searchController.text = str;
    fetchProductByName();
    super.onInit();
  }

  Future<void> fetchProductByName() async {
    isLoading(true);
    products.value =
        await ProductService().getAllProductbyName(searchController.text);
    isLoading(false);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
