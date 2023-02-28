import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find();

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  void onClose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.onClose();
  }

  bool isValid() {
    return passwordEditingController.text.isNotEmpty &&
        EmailValidator.validate(emailEditingController.text);
  }
}
