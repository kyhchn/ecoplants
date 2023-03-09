import 'package:ecoplants/controller/register_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.i;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 26,
                  ),
                  const Text(
                    'hai! ayo buat akunmu bersama.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Utils.verticalSeparator,
                  TextFieldUnObs(
                      controller: controller,
                      label: 'Nama Pengguna',
                      textInputType: TextInputType.text,
                      textEditingController: controller.nameEditingController),
                  const HintText(content: 'Contoh: naruto uciha'),
                  Utils.verticalSeparator,
                  TextFieldUnObs(
                      controller: controller,
                      label: 'Username',
                      textInputType: TextInputType.text,
                      textEditingController:
                          controller.usernameEditingController),
                  const HintText(content: 'Contoh: uchihaboruto11'),
                  Utils.verticalSeparator,
                  TextFieldUnObs(
                      controller: controller,
                      label: 'Email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController:
                          controller.emailEditingControlller),
                  const HintText(content: 'Contoh: narutouciha@gmail.com'),
                  Utils.verticalSeparator,
                  TextFieldObs(
                    controller: controller,
                    isObs: controller.isObscurePassword,
                    label: 'Kata Sandi',
                    textEditingController: controller.passwordEditingController,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const HintText(content: 'Gunakan kombinasi huruf dan angka'),
                  Utils.verticalSeparator,
                  TextFieldObs(
                      controller: controller,
                      isObs: controller.isObscureVerifPassword,
                      label: 'Konfirmasi Kata Sandi',
                      textEditingController:
                          controller.verifPasswordEditingController,
                      textInputType: TextInputType.visiblePassword),
                  Utils.verticalSeparator,
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isAgree.value,
                          onChanged: (value) {
                            controller.isAgree.value = value!;
                            controller.validate();
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Saya menerima syarat dan ketentuan yang berlaku.',
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                  Utils.verticalSeparator,
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Obx(
                      () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14)),
                          onPressed: controller.isValid.value
                              ? () async {
                                  bool isSuccess = await controller.register();
                                  if (isSuccess) {
                                    Get.offAllNamed(Routes.homepage);
                                  }
                                }
                              : null,
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Daftar',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(width: 1, color: Utils.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah Punya Akun? ',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    CustomTextButton(
                      content: 'Masuk',
                      textStyle: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                      onPressed: () => Get.offAndToNamed(Routes.login),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

class TextFieldObs extends StatelessWidget {
  TextFieldObs(
      {super.key,
      required this.controller,
      required this.isObs,
      required this.label,
      required this.textEditingController,
      required this.textInputType});

  final RegisterController controller;
  final TextEditingController textEditingController;
  final Rx<bool> isObs;
  final TextInputType textInputType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: textEditingController,
        onChanged: (value) => controller.validate(),
        keyboardType: textInputType,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        obscureText: isObs.value,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  isObs.value = !isObs.value;
                },
                icon: Icon(
                    isObs.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: isObs.value ? Utils.primaryColor : null)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelStyle: const TextStyle(fontSize: 12),
            labelText: label),
      ),
    );
  }
}

class HintText extends StatelessWidget {
  const HintText({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 16,
        ),
        Text(
          content,
          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}

class TextFieldUnObs extends StatelessWidget {
  const TextFieldUnObs(
      {super.key,
      required this.controller,
      required this.textEditingController,
      required this.textInputType,
      required this.label});

  final RegisterController controller;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.validate(),
      controller: textEditingController,
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: const TextStyle(fontSize: 12),
          labelText: label),
    );
  }
}
