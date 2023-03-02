import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find();

  final emailEditingControlller = TextEditingController();
  final passwordEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final verifPasswordEditingController = TextEditingController();
  final isValid = false.obs;
  final isObscurePassword = false.obs;
  final isObscureVerifPassword = false.obs;
  final isAgree = false.obs;

  @override
  void onClose() {
    emailEditingControlller.dispose();
    passwordEditingController.dispose();
    usernameEditingController.dispose();
    isAgree.close();
    verifPasswordEditingController.dispose();
    super.onClose();
  }

  void validate() {
    isValid.value = EmailValidator.validate(emailEditingControlller.text) &&
        passwordEditingController.text.isNotEmpty &&
        usernameEditingController.text.isNotEmpty &&
        (passwordEditingController.text ==
            verifPasswordEditingController.text) &&
        isAgree.value == true;
  }
}
