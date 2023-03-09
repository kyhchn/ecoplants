import 'package:ecoplants/services/auth_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find();

  final emailEditingControlller = TextEditingController();
  final passwordEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final verifPasswordEditingController = TextEditingController();
  final isValid = false.obs;
  final isObscurePassword = false.obs;
  final isObscureVerifPassword = false.obs;
  final isAgree = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    emailEditingControlller.dispose();
    passwordEditingController.dispose();
    usernameEditingController.dispose();
    verifPasswordEditingController.dispose();
    super.onClose();
  }

  void validate() {
    isValid.value = EmailValidator.validate(emailEditingControlller.text) &&
        passwordEditingController.text.isNotEmpty &&
        nameEditingController.text.isNotEmpty &&
        usernameEditingController.text.isNotEmpty &&
        (passwordEditingController.text ==
            verifPasswordEditingController.text) &&
        isAgree.value == true;
  }

  Future<bool> register() async {
    isLoading(true);
    bool isSuccess = await AuthService().register(
        nameEditingController.text,
        emailEditingControlller.text,
        usernameEditingController.text,
        passwordEditingController.text);
    isLoading(false);
    if (!isSuccess) {
      Get.showSnackbar(const GetSnackBar(
        message: 'failed to register, please try again',
        duration: Duration(seconds: 3),
      ));
    }
    return isSuccess;
  }
}
