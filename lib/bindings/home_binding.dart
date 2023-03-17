import 'package:ecoplants/controller/cart_controller.dart';
import 'package:ecoplants/controller/donation_controller.dart';
import 'package:ecoplants/controller/home_controller.dart';
import 'package:ecoplants/controller/user_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(UserController());
    Get.put(CartController());
    Get.put(DonationController());
  }
}
