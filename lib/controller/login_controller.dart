import 'package:ecoplants/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find();
  final isValid = false.obs;
  final emailorUsernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final isObscure = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    emailorUsernameEditingController.dispose();
    passwordEditingController.dispose();
    super.onClose();
  }

  void validate() {
    isValid.value = passwordEditingController.text.isNotEmpty &&
        emailorUsernameEditingController.value.text.isNotEmpty;
  }

  Future<bool> login() async {
    isLoading(true);
    bool isSuccess = await AuthService().login(
        emailorUsernameEditingController.text, passwordEditingController.text);
    isLoading(false);
    return isSuccess;
  }
}
