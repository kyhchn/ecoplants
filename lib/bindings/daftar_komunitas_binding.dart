import 'package:ecoplants/controller/daftar_komunitas_controller.dart';
import 'package:get/get.dart';

class DaftarKomunitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DaftarKomunitasController());
  }
}
