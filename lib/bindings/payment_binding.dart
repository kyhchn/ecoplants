import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:get/get.dart';

class PayementBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentDetailController());
  }
}
