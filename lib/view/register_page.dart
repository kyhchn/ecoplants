import 'package:ecoplants/controller/register_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  child: Text(
                    'hai! ayo buat akunmu bersama.',
                    style: TextStyle(fontSize: 20),
                    softWrap: false,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                    textEditingController:
                        controller.usernameEditingController),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'E-mail',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  textEditingController: controller.emailEditingControlller,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kata Sandi',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  textEditingController: controller.passwordEditingController,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Konfirmasi Kata Sandi',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  textEditingController:
                      controller.verifPasswordEditingController,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.isAgree.value,
                      activeColor: Utils.primaryColor,
                      onChanged: (val) {
                        controller.isAgree.value = val!;
                      }),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Expanded(
                        child: Text(
                          'saya menerima syarat dan ketentuan yang berlaku.',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: size.width * 0.5,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: controller.isValid()
                        ? () => Get.offAllNamed(Routes.homepage)
                        : null,
                    child: const Text(
                      'Daftar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      )),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  const InputField({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        controller: textEditingController,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.grey.withOpacity(0.5),
            filled: true),
      ),
    );
  }
}
