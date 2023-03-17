import 'dart:io';

import 'package:ecoplants/controller/cart_controller.dart';
import 'package:ecoplants/model/user.dart';
import 'package:ecoplants/services/user_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get i => Get.find();
  late Rx<User> user;
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  Future<void> fetchUser() async {
    isLoading(true);
    final data = await UserService().getUserById();
    if (data != null) {
      user = data.obs;
      final cartController = CartController.i;
      cartController.fetch();
    }
    isLoading(false);
  }

  Future<void> updateProfileImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      final isSuccess = await UserService().updateImageProfile(file);
      if (isSuccess) {
        Get.showSnackbar(Utils.getSnackBar('sukses update foto profile'));
        await fetchUser();
        return;
      }
      Get.showSnackbar(Utils.getSnackBar('gagal update foto profile'));
    }
  }
}
