import 'dart:io';

import 'package:ecoplants/controller/community_controller.dart';
import 'package:ecoplants/services/community_service.dart';
import 'package:ecoplants/utils.dart';
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
  final isLoading = false.obs;
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
    validate();
  }

  void pickDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
    if (result != null) {
      File file = File(result.files.single.path!);
      document = file;
      isDocumentSelected(true);
    }
    validate();
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

  Future<void> register() async {
    isLoading(true);
    final isSuccess = await CommunityService().createCommunity(
        nameEditingController.text,
        emailEditingController.text,
        telpNumbeEditingController.text,
        descriptionEditingController.text,
        image!,
        document!);
    if (isSuccess) {
      final controller = CommunityController.i;
      await controller.fetch();
      Get.back();
      Get.showSnackbar(Utils.getSnackBar('berhasil mendaftarkan komunitas'));
    } else {
      Get.back();
      Get.showSnackbar(Utils.getSnackBar('gagal mendaftarkan komunitas'));
    }
    isLoading(false);
  }
}
