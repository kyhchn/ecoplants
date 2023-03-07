import 'package:ecoplants/services/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find();
  final isValid = false.obs;
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final isObscure = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.onClose();
  }

  void validate() {
    isValid.value = passwordEditingController.text.isNotEmpty &&
        EmailValidator.validate(emailEditingController.text);
  }

  Future<bool> login() async {
    isLoading(true);
    bool isSuccess = await AuthService()
        .login(emailEditingController.text, passwordEditingController.text);
    isLoading(false);
    if (!isSuccess) {
      Get.showSnackbar(const GetSnackBar(
        message: 'failed to login',
        duration: Duration(seconds: 3),
      ));
    }
    return isSuccess;
  }
}
