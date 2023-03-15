import 'package:ecoplants/controller/donate_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  const DonationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DonateController.i;
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
          Image.asset(
            'assets/images/reforestation.jpg',
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
                const Text(
                  'Donasi Penghijauan Hutan Tretes Jawa Timur',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Utils.convertToIdr(40000000),
                  style: TextStyle(
                      color: Utils.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Terkumpul dari ${Utils.convertToIdr(100000000)}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: (size.width - 32) * 0.4,
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
                  children: const [
                    Text(
                      '100 Donasi',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '30 Hari',
                      style: TextStyle(
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
                        builder: (context) => Container(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Pilih Nominal Donasi',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1),
                                          width: 1)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 41,
                                        child: TextField(
                                          onChanged: (value) {
                                            controller.amount.value =
                                                int.parse(value);
                                          },
                                          controller:
                                              controller.amountController,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 12.5,
                                                    horizontal: 16),
                                            prefixText: 'Rp   ',
                                            prefixStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            fillColor: controller
                                                    .amountController
                                                    .value
                                                    .text
                                                    .isNotEmpty
                                                ? Utils.primaryColor
                                                    .withOpacity(0.2)
                                                : Colors.black.withOpacity(0.1),
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Min Rp5.000',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5)),
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
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14)),
                                        onPressed: controller.amount.value != 0
                                            ? () {}
                                            : null,
                                        child: Text(
                                          'Lanjut Pilih Pembayaran',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        )),
                                  ),
                                )
                              ],
                            )),
                      ),
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
