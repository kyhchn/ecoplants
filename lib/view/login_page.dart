import 'package:ecoplants/controller/login_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 110),
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
                Text(
                  'hai! Selamat datang!',
                  style: TextStyle(fontSize: 20),
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
                  'Username atau Email',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: controller.emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.grey.withOpacity(0.5),
                        filled: true),
                  ),
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
                SizedBox(
                  height: 35,
                  child: TextField(
                    controller: controller.passwordEditingController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.grey.withOpacity(0.5),
                        filled: true),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Column(
              children: [
                SizedBox(
                    width: size.width * 0.5,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: controller.isValid()
                            ? () => Get.offAllNamed(Routes.getHomePageRoute())
                            : null,
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Jika belum memiliki akun',
                      style: TextStyle(fontSize: 10),
                    ),
                    TextButton(
                        onPressed: () => Get.toNamed(Routes.register),
                        child: const Text(
                          'Daftar',
                          style: TextStyle(fontSize: 10),
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
