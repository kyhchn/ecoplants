import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _emailEditingControlller = TextEditingController().obs;
  final _passwordEditingController = TextEditingController().obs;
  final _usernameEditingController = TextEditingController().obs;
  final _verifPasswordEditingController = TextEditingController().obs;
  final _isAgree = false.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    usernameEditingController: _usernameEditingController),
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
                InputField(usernameEditingController: _emailEditingControlller)
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
                    usernameEditingController: _passwordEditingController)
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
                    usernameEditingController: _verifPasswordEditingController)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                      value: _isAgree.value,
                      activeColor: Utils.primaryColor,
                      onChanged: (val) {
                        _isAgree.value = val!;
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
                    onPressed: () {},
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
  const InputField({
    super.key,
    required Rx<TextEditingController> usernameEditingController,
  }) : _usernameEditingController = usernameEditingController;

  final Rx<TextEditingController> _usernameEditingController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 35,
        child: TextField(
          controller: _usernameEditingController.value,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              fillColor: Colors.grey.withOpacity(0.5),
              filled: true),
        ),
      ),
    );
  }
}
