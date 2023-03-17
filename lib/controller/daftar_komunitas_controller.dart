import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarKomunitasController extends GetxController {
  static DaftarKomunitasController get i => Get.find();
  final isImageSelected = false.obs;
  final isDocumentSelected = false.obs;
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final telpNumbeEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();
  final index = 0.obs;
  final isValid = false.obs;
  File? image, document;

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpg', 'png', 'heic'], type: FileType.custom);
    if (result != null) {
      File file = File(result.files.single.path!);
      image = file;
      isImageSelected(true);
    }
  }

  void pickDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
    if (result != null) {
      File file = File(result.files.single.path!);
      document = file;
      isDocumentSelected(true);
    }
  }

  @override
  void onClose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    telpNumbeEditingController.dispose();
    descriptionEditingController.dispose();
    super.onClose();
  }

  void validate() {
    isValid.value = isImageSelected.value &&
        isDocumentSelected.value &&
        nameEditingController.text.isNotEmpty &&
        emailEditingController.text.isNotEmpty &&
        EmailValidator.validate(emailEditingController.text) &&
        telpNumbeEditingController.text.isNotEmpty &&
        descriptionEditingController.text.isNotEmpty;
  }
}
