import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PaymentDetailController.i;
    return Scaffold(
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
              ? Expanded(child: InformationWidget(controller: controller))
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils.verticalSeparator,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Utils.primaryColor),
                                      onPressed: () {})
                                ],
                              ),
                              Utils.verticalSeparator,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Naruto Uzumaki',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '087387283123',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Utils.verticalSeparator,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          color: Utils.primaryColor),
                                      onPressed: () {})
                                ],
                              ),
                              Utils.verticalSeparator,
                              const Text(
                                'Jl. Mt Haryono Gg Brawijaya 10 Rt10/Rw02, Lowokwaru, Malang, Jawa Timur. 62315',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Utils.verticalSeparator,
                        const Text(
                          'Pilih Pengiriman',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Utils.verticalSeparator,
                        ShippingMethodItem(controller: controller),
                        Utils.verticalSeparator,
                        ShippingMethodItem(controller: controller),
                        Utils.verticalSeparator,
                        ShippingMethodItem(controller: controller), 
                      ],
                    ),
                  ),
                )),
          SizedBox(
            height: 101,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Column(
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
                      Text(
                        'Total: RP 300.000',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Utils.primaryColor),
                      )
                    ],
                  ),
                  Utils.verticalSeparator,
                  Obx(
                    () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 44),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Utils.primaryColor),
                        onPressed: controller.isValid.value ? () {} : null,
                        child: const Text(
                          'Lanjut Pilih Pengiriman',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ShippingMethodItem extends StatelessWidget {
  const ShippingMethodItem({
    super.key,
    required this.controller,
  });

  final PaymentDetailController controller;

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
              value: ShippingMethod(
                  company: 'JNE Reguler', price: 18000, maxDay: 5, minDay: 3),
              groupValue: controller.shippingMethod.value,
              onChanged: (value) {
                controller.shippingMethod.value = value;
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'JNE Reguler',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Estimasi 3-5 Hari',
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.3)),
              )
            ],
          ),
          Text(
            Utils.convertToIdr(18000),
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
                color: controller.index.value == 2
                    ? Utils.primaryColor
                    : Colors.black.withOpacity(0.5),
              ),
              GestureDetector(
                onTap: () => controller.index.value = 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card_outlined,
                      color: controller.index.value == 2
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

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.controller,
  });

  final PaymentDetailController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Utils.verticalSeparator,
        FormItem(
          controller: controller,
          helper: 'Wajib diisi',
          label: 'Nama Penerima',
          textInputType: TextInputType.name,
          textEditingController: controller.nameController,
        ),
        FormItem(
          controller: controller,
          helper: 'Min. 9 angka',
          label: 'Nomor Telepon',
          textInputType: TextInputType.number,
          textEditingController: controller.telpNumberController,
        ),
        FormItem(
          controller: controller,
          helper: 'Contoh: Jawa Barat',
          label: 'Provinsi',
          textInputType: TextInputType.name,
          textEditingController: controller.provinceController,
        ),
        FormItem(
          controller: controller,
          helper: 'Contoh: Kota Malang, Lowokwaru',
          label: 'Kota & Kecamatan',
          textInputType: TextInputType.text,
          textEditingController: controller.cityAndSubDistrictController,
        ),
        FormItem(
          controller: controller,
          helper: 'Contoh: 65145',
          label: 'Kode Pos',
          textInputType: TextInputType.number,
          textEditingController: controller.postalCodeController,
        ),
        FormItem(
          controller: controller,
          helper: 'Contoh: Jl.Sudirman',
          label: 'Alamat Lengkap',
          textInputType: TextInputType.text,
          textEditingController: controller.addressController,
        ),
        FormItem(
          controller: controller,
          helper: 'Contoh: Kosan 103',
          label: 'Catatan Untuk Kurir (Opsional)',
          textInputType: TextInputType.text,
          textEditingController: controller.notesController,
        ),
      ],
    );
  }
}

class FormItem extends StatelessWidget {
  FormItem(
      {super.key,
      required this.controller,
      required this.helper,
      required this.label,
      required this.textEditingController,
      required this.textInputType});

  final PaymentDetailController controller;
  final TextEditingController textEditingController;
  final String helper, label;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => controller.validate(),
          controller: textEditingController,
          keyboardType: textInputType,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              focusColor: Utils.primaryColor,
              helperText: helper,
              helperStyle: const TextStyle(
                fontSize: 12,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(fontSize: 12),
              labelText: label),
        ),
        Utils.verticalSeparator
      ],
    );
  }
}
