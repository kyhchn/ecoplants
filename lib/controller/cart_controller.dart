import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get i => Get.find();
  final listCart = [
    {
      'controller': false.obs,
      'quantity' : 0.obs,
    }
  ].obs;

  final isSelectAll = false.obs;
}
