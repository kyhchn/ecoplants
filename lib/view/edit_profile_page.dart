import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
          'Ubah Profile',
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Utils.verticalSeparator,
          Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/dummy_profile.png'),
                radius: 40,
              ),
              Utils.verticalSeparator,
              Text(
                'Ubah Foto Profile',
                style: TextStyle(
                    color: Utils.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 10),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Colors.black.withOpacity(0.1), width: 2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Info Profile',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileAtribute(atribut: 'Nama', value: 'Ikbal Marwan'),
                const SizedBox(
                  height: 10,
                ),
                ProfileAtribute(atribut: 'Username', value: 'ikbal777'),
              ],
            ),
          ),
          Container(
            height: 232,
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black.withOpacity(0.1), width: 2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Info Pribadi',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Utils.verticalSeparator,
                ProfileAtribute(atribut: 'User ID', value: '8877766'),
                Utils.verticalSeparator,
                ProfileAtribute(atribut: 'E-mail', value: 'ikbalm11@gmail.com'),
                Utils.verticalSeparator,
                ProfileAtribute(atribut: 'Nomor HP', value: ''),
                Utils.verticalSeparator,
                ProfileAtribute(atribut: 'Jenis Kelamin', value: ''),
                Utils.verticalSeparator,
                ProfileAtribute(atribut: 'Tanggal Lahir', value: ''),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        color: Colors.black.withOpacity(0.2), width: 1))),
            child: Center(
              child: CustomTextButton(
                  content: 'Tutup Akun',
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Utils.primaryColor),
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileAtribute extends StatelessWidget {
  ProfileAtribute({
    required this.atribut,
    required this.value,
    super.key,
  });
  String atribut, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            atribut,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          value != '' ? value : '-',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8)),
        ),
        const Spacer(),
        value != ''
            ? CustomActionButton(
                onPressed: () => Get.toNamed(Routes.editProfileField,
                    arguments: {'atribut': atribut, 'value': value}),
              )
            : CustomTextButton(
                content: 'Isi',
                textStyle: TextStyle(
                    color: Utils.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                onPressed: () => Get.toNamed(Routes.editProfileField,
                    arguments: {'atribut': atribut, 'value': value}))
      ],
    );
  }
}

class CustomActionButton extends StatelessWidget {
  CustomActionButton({
    required this.onPressed,
    super.key,
  });
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black,
            size: 12,
          )),
    );
  }
}
