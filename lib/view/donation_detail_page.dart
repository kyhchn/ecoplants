import 'package:ecoplants/controller/donate_controller.dart';
import 'package:ecoplants/model/donation.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  DonationDetailPage({super.key});
  Donation donation = Get.arguments['donation'];
  @override
  Widget build(BuildContext context) {
    final controller = DonateController.i;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black.withOpacity(0.5),
            )),
        title: Text(
          'Detail Donasi',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.5)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            donation.picture,
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Utils.verticalSeparator,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donation.name,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Utils.convertToIdr(donation.wallet),
                  style: TextStyle(
                      color: Utils.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Terkumpul dari ${Utils.convertToIdr(donation.target)}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: (size.width - 32) *
                          (donation.wallet / donation.target),
                      color: Utils.primaryColor,
                      height: 4,
                    ),
                    Expanded(
                        child: Container(
                      height: 4,
                      color: Utils.primaryColor.withOpacity(0.2),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${donation.numDonate} Donasi',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${donation.remainDay} Hari',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextButton(
                  content: 'Rincian Penggunaan Data',
                  textStyle: TextStyle(color: Utils.primaryColor, fontSize: 12),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Penggalangan Data',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Utils.verticalSeparator,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Penggalangan Dana',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/impala.jpg'),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Impala Universitas Brawijaya',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Lembaga Terverifikasi',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5)),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Utils.verticalSeparator,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Rencana Penggunaan Data',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Utils.verticalSeparator,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Kabar Terbaru',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 18),
                    child: ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Obx(
                          () => Container(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 38, bottom: 18),
                              height: size.height * 0.77,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: controller.index.value == 0
                                  ? AmountPickerBody(controller: controller)
                                  : controller.index.value == 1
                                      ? PaymentMethodPickerBody(
                                          controller: controller)
                                      : ValidateDonatePaymentBody(
                                          controller: controller,
                                          donation: donation,
                                        )),
                        ),
                      ).then((value) => controller.onCloseModal()),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Donasi',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ValidateDonatePaymentBody extends StatelessWidget {
  const ValidateDonatePaymentBody(
      {super.key, required this.controller, required this.donation});

  final DonateController controller;
  final Donation donation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Nominal Donasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 41,
            decoration: BoxDecoration(
                color: Utils.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rp',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  controller.amount.value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
        Utils.verticalSeparator,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/${controller.paymentMethod.value.toLowerCase()}.png',
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                'Bank ${controller.paymentMethod.value}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              CustomTextButton(
                  content: 'Ganti',
                  textStyle: TextStyle(
                      color: Utils.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  onPressed: () => controller.index.value = 1)
            ],
          ),
        ),
        Utils.verticalSeparator,
        Text(
          'Berdoa di donasi ini (opsional)',
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        Utils.verticalSeparator,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: Text(
            'Tulis doa untuk penggalang dana atau dirimu sendiri disini. Biar doa kamu bisa dilihat dan diamini oleh #orangbaik lainnya.',
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () async {
                final data = await controller.checkOut(donation.iD);
                if (data != null) {
                  controller.isSubmit.value = true;
                  Get.back();
                  Get.toNamed(Routes.donationPaymentCountdown,
                      arguments: {'donationTransaction': data});
                } else {
                  Get.back();
                  Get.showSnackbar(
                      Utils.getSnackBar('gagal melakukan pembayaran'));
                }
              },
              child: const Text(
                'Bayar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
        )
      ],
    );
  }
}

class PaymentMethodPickerBody extends StatelessWidget {
  const PaymentMethodPickerBody({
    super.key,
    required this.controller,
  });

  final DonateController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Pilih Nominal Donasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
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
        ),
        PaymentItem(
          controller: controller,
          asset: 'assets/images/bni.png',
          value: 'BNI',
        ),
        PaymentItem(
          controller: controller,
          asset: 'assets/images/cimbniaga.png',
          value: 'CIMBNIAGA',
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: controller.paymentMethod.value != ''
                    ? () => controller.index.value = 2
                    : null,
                child: const Text(
                  'Lanjut Bayar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
          ),
        )
      ],
    );
  }
}

class AmountPickerBody extends StatelessWidget {
  const AmountPickerBody({
    super.key,
    required this.controller,
  });

  final DonateController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Pilih Nominal Donasi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 18,
        ),
        Column(
          children: [
            NominalTile(
              amount: 5000,
              controller: controller,
            ),
            NominalTile(
              amount: 10000,
              controller: controller,
            ),
            NominalTile(
              amount: 20000,
              controller: controller,
            ),
            NominalTile(
              amount: 50000,
              controller: controller,
            ),
            NominalTile(
              amount: 100000,
              controller: controller,
            ),
            NominalTile(
              amount: 1000000,
              controller: controller,
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Nominal Donasi Lainnya',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 14,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 41,
                child: TextField(
                  onChanged: (value) {
                    controller.amount.value = int.parse(value);
                  },
                  controller: controller.amountController,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 16),
                    prefixText: 'Rp   ',
                    prefixStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    fillColor: controller.amountController.value.text.isNotEmpty
                        ? Utils.primaryColor.withOpacity(0.2)
                        : Colors.black.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Min Rp5.000',
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: controller.amount.value != 0
                    ? () => controller.index.value = 1
                    : null,
                child: const Text(
                  'Lanjut Pilih Pembayaran',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
          ),
        )
      ],
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
  final DonateController controller;

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
                'Bank $value',
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

class NominalTile extends StatelessWidget {
  NominalTile({super.key, required this.amount, required this.controller});
  DonateController controller;
  int amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.amount.value = amount;
            controller.amountController.text = amount.toString();
          },
          child: Obx(
            () => Container(
              height: 41,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: controller.amount.value == amount
                      ? Utils.primaryColor.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.1), width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Utils.convertToIdr(amount),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Utils.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
        Utils.verticalSeparator
      ],
    );
  }
}
