import 'package:ecoplants/controller/user_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/services/cache_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.i;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/dummy_profile.png'),
                  radius: 25,
                ),
                const SizedBox(
                  width: 23,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userController.user.value.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      userController.user.value.phone.isNotEmpty
                          ? userController.user.value.name
                          : '-',
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.6)),
                    ),
                    Text(
                      userController.user.value.email,
                      style: TextStyle(
                          fontSize: 10, color: Colors.black.withOpacity(0.6)),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Get.toNamed(Routes.editProfile),
                    icon: const Icon(
                      Icons.edit_outlined,
                      size: 24,
                    ))
              ],
            ),
          ),
        ),
        Utils.verticalSeparator,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Riwayat Transaksi',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              CustomTextButton(
                  content: 'Lihat Semua',
                  textStyle: TextStyle(color: Utils.primaryColor, fontSize: 10),
                  onPressed: () {})
            ],
          ),
        ),
        Utils.verticalSeparator,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 26.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HighlightWidget(
                asset: 'assets/svg/wallet.svg',
                text: 'Belum Bayar',
              ),
              HighlightWidget(
                asset: 'assets/svg/shipping.svg',
                text: 'Dikirim',
              ),
              HighlightWidget(
                asset: 'assets/svg/star.svg',
                text: 'Beli',
              )
            ],
          ),
        ),
        Utils.verticalSeparator,
        CustomTile(
            text: 'Voucher Saya',
            actions: SvgPicture.asset(
              'assets/svg/gift.svg',
              width: 24,
              height: 24,
            )),
        Utils.verticalSeparator,
        CustomTile(
            text: 'Pusat Bantuan',
            actions: const Icon(
              Icons.help_outline,
              size: 24,
              color: Colors.black,
            )),
        Utils.verticalSeparator,
        CustomTile(
            text: 'Pengaturan Aplikasi',
            actions: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: Colors.black,
            )),
        Utils.verticalSeparator,
        CustomTile(
            text: 'Tentang Ecoplants',
            actions: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: Colors.black,
            )),
        Utils.verticalSeparator,
        CustomTile(
            text: 'Keluar Akun',
            actions: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                await CacheService.storage.remove('token');
                Get.offAllNamed(Routes.carousel);
              },
              child: Icon(
                Icons.login,
                size: 24,
                color: Utils.red.withOpacity(0.8),
              ),
            )),
        Utils.verticalSeparator,
      ],
    );
  }
}

class CustomTile extends StatelessWidget {
  CustomTile({super.key, required this.text, required this.actions});
  String text;
  Widget actions;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      height: 56,
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: Colors.black.withOpacity(0.05), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          actions
        ],
      ),
    );
  }
}

class HighlightWidget extends StatelessWidget {
  HighlightWidget({super.key, required this.asset, required this.text});
  String asset, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 13),
          height: 54,
          width: 54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: SvgPicture.asset(
            asset,
            width: 28,
            height: 26,
            color: Utils.primaryColor,
          ),
        ),
        Utils.verticalSeparator,
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
