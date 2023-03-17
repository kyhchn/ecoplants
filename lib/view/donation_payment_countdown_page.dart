import 'package:ecoplants/controller/donate_controller.dart';
import 'package:ecoplants/controller/home_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationPaymentCountdownPage extends StatelessWidget {
  const DonationPaymentCountdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DonateController.i;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black.withOpacity(0.5),
              size: 24,
            )),
        title: Text(
          'Pembayaran',
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 17, right: 17, top: 12, bottom: 28),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.1), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank ${controller.paymentMethod.value}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Image.asset(
                          'assets/images/${controller.paymentMethod.value.toLowerCase()}.png',
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nomor Virtual Account',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '12345678',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            CustomTextButton(
                                content: 'Salin',
                                textStyle: TextStyle(
                                    color: Utils.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jumlah Donasi',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          Utils.convertToIdr(controller.amount.value),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Senin, 5 Des 2022 16.13 WIB',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              'Batas Akhir Pembayaran',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.access_time_outlined,
                                size: 10,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '00:58:24',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                          content: 'Lihat Cara Bayar',
                          textStyle: TextStyle(
                              color: Utils.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        child: const Text(
                          'Donasi Lagi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))),
                Utils.verticalSeparator,
                SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Utils.primaryColor, width: 1))),
                        onPressed: () {
                          final controller = HomeController.i;
                          controller.index.value = 2;
                          Get.back();
                          Get.back();
                        },
                        child: Text(
                          'Cek Status Donasi',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Utils.primaryColor),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
