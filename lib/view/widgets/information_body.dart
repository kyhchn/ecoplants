import 'package:ecoplants/controller/payment_detail_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';

class InformationBody extends StatelessWidget {
  const InformationBody({super.key, required this.controller});

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
          onChanged: (value) => controller.informationValidate(),
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
