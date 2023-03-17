import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({
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
                  children: [
                    Text(
                      controller.nameController.text,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      controller.telpNumberController.text,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
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
                Text(
                  '${controller.addressController.text}, ${controller.cityAndSubDistrictController.text}, ${controller.provinceController.text}, ${controller.postalCodeController.text}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
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
              'Metode Pembayaran',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Utils.verticalSeparator,
          PaymentItem(
              controller: controller,
              asset: 'assets/images/bca.png',
              value: 'BCA'),
          PaymentItem(
              controller: controller,
              asset: 'assets/images/bri.png',
              value: 'BRI'),
          PaymentItem(
            controller: controller,
            asset: 'assets/images/mandiri.png',
            value: 'MANDIRI',
          )
        ],
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  PaymentItem(
      {super.key,
      required this.controller,
      required this.asset,
      required this.value});
  String value, asset;
  final PaymentDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                height: 48,
                width: 48,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "Bank $value",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              Obx(
                () => Radio(
                  value: value,
                  groupValue: controller.paymentMethod.value,
                  onChanged: (value) {
                    controller.paymentMethod.value = value!;
                    controller.paymentValidate();
                  },
                ),
              )
            ],
          ),
        ),
        Utils.verticalSeparator
      ],
    );
  }
}
