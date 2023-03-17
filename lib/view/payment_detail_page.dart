import 'package:ecoplants/controller/home_controller.dart';
import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/controller/user_controller.dart';
import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/information_body.dart';
import 'package:ecoplants/view/widgets/payment_body.dart';
import 'package:ecoplants/view/widgets/post_payment_body.dart';
import 'package:ecoplants/view/widgets/shipping_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentDetailPage extends StatelessWidget {
  PaymentDetailPage({super.key});
  final Product product = Get.arguments['product'];
  int quantity = Get.arguments['quantity'];
  @override
  Widget build(BuildContext context) {
    final controller = PaymentDetailController.i;
    return WillPopScope(
      onWillPop: () async {
        controller.index.value != 0 ? controller.index.value-- : Get.back();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black.withOpacity(0.5),
              )),
          title: Text(
            'Informasi',
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StatusBar(controller: controller),
            Utils.verticalSeparator,
            Obx(() => controller.index.value == 0
                ? Expanded(
                    child: InformationBody(
                    controller: controller,
                  ))
                : controller.index.value == 1
                    ? Expanded(
                        child: ShippingBody(controller: controller),
                      )
                    : controller.index.value == 2
                        ? Expanded(
                            child: PaymentBody(controller: controller),
                          )
                        : Expanded(
                            child: PostPaymentBody(
                            controller: controller,
                            product: product,
                          ))),
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: controller.index.value != 3
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/dropDownBox.svg',
                                  height: 20,
                                  width: 20,
                                  color: Utils.primaryColor,
                                ),
                                Text(
                                  'Lihat Detail Pesanan',
                                  style: TextStyle(
                                      color: Utils.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Obx(
                                  () => Text(
                                    controller.shippingIsValid.value
                                        ? 'Total: ${Utils.convertToIdr(controller.listShippingMethod.elementAt(controller.shippingMethod.value).price + (product.price))}'
                                        : Utils.convertToIdr(product.price),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Utils.primaryColor),
                                  ),
                                )
                              ],
                            ),
                            Utils.verticalSeparator,
                            Obx(
                              () => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize:
                                          const Size(double.infinity, 44),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Utils.primaryColor),
                                  onPressed: controller.getOnPressedFunction(
                                      quantity, product.iD),
                                  child: Text(
                                    controller.index.value == 0
                                        ? 'Lanjut Pilih Pengiriman'
                                        : controller.index.value == 1
                                            ? 'Lanjut Pilih Pembayaran'
                                            : 'Bayar',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize:
                                        const Size(double.infinity, 44),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Utils.primaryColor),
                                onPressed: () async {
                                  final homecontroller = HomeController.i;
                                  final userController = UserController.i;
                                  await userController.fetchUser();
                                  homecontroller.index.value = 0;
                                  Get.until((route) =>
                                      Get.currentRoute == '/home-page');
                                },
                                child: const Text(
                                  'Belanja Lagi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )),
                            Utils.verticalSeparator,
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize:
                                        const Size(double.infinity, 44),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Utils.primaryColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white),
                                onPressed: () async {
                                  final homecontroller = HomeController.i;
                                  final userController = UserController.i;
                                  await userController.fetchUser();
                                  homecontroller.index.value = 2;
                                  Get.until((route) =>
                                      Get.currentRoute == '/home-page');
                                },
                                child: Text(
                                  'Cek Status Pemesanan',
                                  style: TextStyle(
                                      color: Utils.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
    required this.controller,
  });

  final PaymentDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4.5),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => controller.index.value = 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Utils.primaryColor,
                      size: 24,
                    ),
                    Text(
                      'Informasi',
                      style: TextStyle(
                        color: controller.index.value == 0
                            ? Utils.primaryColor
                            : Colors.black.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 54,
                height: 3,
                color: controller.index.value >= 1
                    ? Utils.primaryColor
                    : Colors.black.withOpacity(0.5),
              ),
              GestureDetector(
                onTap: () => controller.index.value = 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/pickup.svg',
                      color: controller.index.value >= 1
                          ? Utils.primaryColor
                          : Colors.black.withOpacity(0.5),
                      height: 24,
                      width: 24,
                    ),
                    Text(
                      'Pengiriman',
                      style: TextStyle(
                        color: controller.index.value >= 1
                            ? Utils.primaryColor
                            : Colors.black.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 54,
                height: 3,
                color: controller.index.value >= 2
                    ? Utils.primaryColor
                    : Colors.black.withOpacity(0.5),
              ),
              GestureDetector(
                onTap: () => controller.index.value >= 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      color: controller.index.value >= 2
                          ? Utils.primaryColor
                          : Colors.black.withOpacity(0.5),
                      size: 24,
                    ),
                    Text(
                      'Pembayaran',
                      style: TextStyle(
                        color: controller.index.value == 2
                            ? Utils.primaryColor
                            : Colors.black.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
