import 'package:ecoplants/controller/login_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/home_page.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.i;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 26,
                ),
                const Text(
                  'hai! Selamat datang!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Utils.verticalSeparator,
                TextField(
                  onChanged: (value) => controller.validate(),
                  controller: controller.emailEditingController,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelStyle: const TextStyle(fontSize: 12),
                      labelText: 'Nama Pengguna atau Email'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Contoh: narutouciha@gmail.com',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                Utils.verticalSeparator,
                Obx(
                  () => TextField(
                    controller: controller.passwordEditingController,
                    onChanged: (value) => controller.validate(),
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isObscure.value =
                                  !controller.isObscure.value;
                            },
                            icon: Icon(
                                controller.isObscure.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: controller.isObscure.value
                                    ? Utils.primaryColor
                                    : null)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelStyle: const TextStyle(fontSize: 12),
                        labelText: 'Kata Sandi'),
                  ),
                ),
                Utils.verticalSeparator,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lupa detail login Anda? ',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 12),
                    ),
                    CustomTextButton(
                        content: 'Dapatkan bantuan untuk login',
                        onPressed: () {},
                        textStyle: const TextStyle(fontSize: 12))
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
                            padding: const EdgeInsets.symmetric(vertical: 10)),

                        onPressed: controller.isValid.value
                            ? () async {
                                bool isSuccess = await controller.login();
                                if (isSuccess) {
                                  Get.offAllNamed(Routes.homepage);
                                }
                              }
                            : null,
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Masuk',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
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
                      'Belum punya akun? ',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    CustomTextButton(
                      content: 'Daftar',
                      onPressed: () => Get.offAndToNamed(Routes.register),
                      textStyle: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
