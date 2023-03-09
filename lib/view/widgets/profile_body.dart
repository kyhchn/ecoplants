import 'package:ecoplants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await GetStorage().remove('token');
          Get.offAllNamed(Routes.carousel);
        },
        child: Text('logout'));
  }
}
