import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileFieldPage extends StatelessWidget {
  EditProfileFieldPage({super.key});
  final atribut = Get.arguments['atribut'];
  String value = Get.arguments['value'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black.withOpacity(0.5),
              size: 24,
            )),
        title: Text(
          'Ubah $atribut',
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: const TextStyle(fontSize: 12),
                    labelText: atribut),
              ),
            ),
            Utils.verticalSeparator,
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: ()=>Get.back(),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
