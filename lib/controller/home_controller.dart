import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find();
  final searchController = TextEditingController();
  final index = 0.obs;
  final list = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png'
  ];
  @override
  void onClose() {
    searchController.dispose();
    index.close();
    super.onClose();
  }
}
