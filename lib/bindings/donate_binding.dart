import 'package:ecoplants/controller/donate_controller.dart';
import 'package:get/get.dart';

class DonateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DonateController());
  }
}
