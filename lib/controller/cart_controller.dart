import 'package:ecoplants/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get i => Get.find();
  final listProduct = <String, dynamic>{}.obs;
}
