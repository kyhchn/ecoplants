// ignore_for_file: deprecated_member_use

import 'package:ecoplants/controller/home_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/donation_body.dart';
import 'package:ecoplants/view/widgets/home_body.dart';
import 'package:ecoplants/view/widgets/profile_body.dart';
import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:ecoplants/view/widgets/transaction_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final list = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = HomeController.i;
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controller.index.value != 3
            ? CustomAppBar(
                textFieldColor: controller.index.value != 0
                    ? Colors.black.withOpacity(0.05)
                    : Colors.white,
                onSubmitted: (str) {
                  controller.searchController.text = '';
                  Get.toNamed(Routes.search, arguments: {'search': str});
                },
                searchController: controller.searchController,
                appBar: AppBar(
                  actionsIconTheme: IconThemeData(
                      color: controller.index.value != 0
                          ? Colors.black.withOpacity(0.5)
                          : null),
                  backgroundColor: controller.index.value != 0
                      ? Colors.white
                      : Utils.primaryColor,
                ),
              )
            : AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leadingWidth: 127,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                      )),
                  StackIcon(quantity: 10, iconData: Icons.email_outlined),
                  StackIcon(
                      quantity: 10, iconData: Icons.shopping_cart_outlined),
                  const SizedBox(
                    width: 16,
                  )
                ],
                actionsIconTheme: IconThemeData(
                    color: Colors.black.withOpacity(0.5), size: 24),
                leading: Container(
                  margin: const EdgeInsets.symmetric(vertical: 17),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 4,
                    bottom: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Utils.primaryColor.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Beli Tanaman',
                        style:
                            TextStyle(color: Utils.primaryColor, fontSize: 12),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Utils.primaryColor,
                        size: 12,
                      )
                    ],
                  ),
                ),
              ),
        body: Obx(() => controller.index.value == 0
            ? HomeBody(size: size, list: list)
            : controller.index.value == 1
                ? const DonationBody()
                : controller.index.value == 2
                    ? const TransactionBody()
                    : const ProfileBody()),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 24,
                    color: controller.index.value == 0
                        ? Utils.primaryColor
                        : Colors.grey.withOpacity(0.9),
                  ),
                  label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/donasi.svg',
                    height: 25,
                    width: 25,
                    color:
                        controller.index.value == 1 ? Utils.primaryColor : null,
                  ),
                  label: 'Peduli'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.receipt_long_outlined,
                    color: controller.index.value == 2
                        ? Utils.primaryColor
                        : Colors.grey.withOpacity(0.9),
                  ),
                  label: 'Transaksi'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color:
                        controller.index.value == 3 ? Utils.primaryColor : null,
                  ),
                  label: 'Akun'),
            ],
            onTap: (val) {
              controller.index.value = val;
            },
            currentIndex: controller.index.value,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
