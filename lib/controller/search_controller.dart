// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  @override
  void onInit() {
    searchController.text = str;
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    isProduct.close();
    super.onClose();
  }
}
