import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPaymentBody extends StatelessWidget {
  const PostPaymentBody({
    super.key,
    required this.controller,
  });

  final PaymentDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSeparator,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 275,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kontak Informasi',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    CustomTextButton(
                        content: 'Ubah',
                        textStyle:
                            TextStyle(fontSize: 12, color: Utils.primaryColor),
                        onPressed: () => controller.index.value = 0)
                  ],
                ),
                Utils.verticalSeparator,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Naruto Uzumaki',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '087387283123',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.05),
                  width: double.infinity,
                ),
                Utils.verticalSeparator,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alamat Pengiriman',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    CustomTextButton(
                        content: 'Ubah',
                        textStyle:
                            TextStyle(fontSize: 12, color: Utils.primaryColor),
                        onPressed: () => controller.index.value = 0)
                  ],
                ),
                Utils.verticalSeparator,
                const Text(
                  'Jl. Mt Haryono Gg Brawijaya 10 Rt10/Rw02, Lowokwaru, Malang, Jawa Timur. 62315',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Utils.verticalSeparator,
                Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.05),
                  width: double.infinity,
                ),
                Utils.verticalSeparator,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jasa Pengiriman',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    CustomTextButton(
                        content: 'Ubah',
                        textStyle: TextStyle(
                            color: Utils.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                        onPressed: () => controller.index.value = 1),
                    Utils.verticalSeparator,
                  ],
                ),
                Utils.verticalSeparator,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.listShippingMethod
                            .elementAt(controller.shippingMethod.value)
                            .company,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(controller.listShippingMethod
                          .elementAt(controller.shippingMethod.value)
                          .getEstimatedText())
                    ],
                  ),
                ),
                Utils.verticalSeparator,
                Obx(
                  () => Text(
                    Utils.convertToIdr(controller.listShippingMethod
                        .elementAt(controller.shippingMethod.value)
                        .price),
                    style: TextStyle(
                      color: Utils.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          Utils.verticalSeparator,
          const Center(
            child: Text(
              'Pembayaran',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Utils.verticalSeparator,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4.5),
            height: 83,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(0.1))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BCA Virtual Account',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '3901 0822 2222 5510',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    CustomTextButton(
                      content: 'Salin',
                      textStyle: TextStyle(
                          color: Utils.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      onPressed: () {},
                    )
                  ],
                ),
                Text(
                  'Total Pembayaran',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        Utils.convertToIdr(controller.listShippingMethod
                                .elementAt(controller.shippingMethod.value)
                                .price +
                            300000),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                    CustomTextButton(
                      content: 'Lihat Detail',
                      textStyle: TextStyle(
                          color: Utils.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
          Utils.verticalSeparator,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Senin, 5 Des 2022 16.13 WIB',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Batas Akhir Pembayaran',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    )
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        elevation: 0,
                        minimumSize: const Size(90, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 0)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.av_timer_rounded,
                          size: 12,
                        ),
                        Text(
                          '00:58:24',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Utils.verticalSeparator,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                  content: 'Lihat Cara Bayar',
                  textStyle: TextStyle(
                      color: Utils.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}