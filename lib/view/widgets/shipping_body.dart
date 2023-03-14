import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingBody extends StatelessWidget {
  const ShippingBody({
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
            height: 170,
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
                )
              ],
            ),
          ),
          Utils.verticalSeparator,
          const Text(
            'Pilih Pengiriman',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Utils.verticalSeparator,
          ShippingMethodItem(
              controller: controller,
              price: 18000,
              subtitle: 'Estimasi 3 - 5 Hari',
              title: 'JNE Reguler',
              value: 0),
          Utils.verticalSeparator,
          ShippingMethodItem(
              controller: controller,
              value: 1,
              price: 20000,
              subtitle: 'Estimasi 3-5 Hari',
              title: 'J&t Express'),
          Utils.verticalSeparator,
          ShippingMethodItem(
            controller: controller,
            price: 12000,
            subtitle: 'Estimasi 5 - 7 Hari',
            title: 'Sicepat Ekonomi',
            value: 2,
          ),
        ],
      ),
    );
  }
}

class ShippingMethodItem extends StatelessWidget {
  ShippingMethodItem(
      {super.key,
      required this.controller,
      required this.value,
      required this.title,
      required this.subtitle,
      required this.price});
  final int value, price;
  final PaymentDetailController controller;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Radio(
              value: value,
              groupValue: controller.shippingMethod.value,
              onChanged: (value) {
                controller.shippingMethod.value = value!;
                controller.shippingValidate();
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.3)),
              )
            ],
          ),
          Text(
            Utils.convertToIdr(price),
            style: TextStyle(
                color: Utils.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}