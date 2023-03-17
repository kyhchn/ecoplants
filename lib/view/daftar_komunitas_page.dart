import 'package:dotted_border/dotted_border.dart';
import 'package:ecoplants/controller/daftar_komunitas_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class DaftarKomunitasPage extends StatelessWidget {
  const DaftarKomunitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DaftarKomunitasController.i;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                if (controller.index.value == 0) {
                  Get.back();
                } else {
                  controller.index.value = 0;
                }
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black.withOpacity(0.5),
                size: 24,
              )),
          title: Obx(
            () => Text(
              controller.index.value == 0 ? 'Daftar Komunitas' : 'Persyaratan',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => controller.index.value == 0
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/daftar_komunitas.png',
                                height: 155,
                                width: 265,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 64,
                              ),
                              const Text(
                                'Buat Komunitas Pecinta Lingkungan Sekarang di Ecoplanst Untuk Dapat Menggalang Dana!',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Utils.verticalSeparator,
                              Text(
                                'Anda akan membuat komunitas yang memiliki kepedulian dengan lingkungan. sekarang anda akan memiliki ruang sendiri dengan anggota anda.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Image.asset(
                              'assets/images/daftar_komunitas.png',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () async {
                                controller.pickImage();
                                controller.validate();
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                color: Colors.black.withOpacity(0.5),
                                strokeWidth: 1,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(17.5),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Foto Profile Komunitas',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        DottedBorder(
                                          color: Colors.black.withOpacity(0.5),
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(10),
                                          strokeWidth: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(17.5),
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  Obx(
                                                    () => controller
                                                            .isImageSelected
                                                            .value
                                                        ? Image.file(
                                                            controller.image!,
                                                            width: 24,
                                                            height: 24,
                                                          )
                                                        : const Icon(
                                                            Icons.image,
                                                            color: Color(
                                                                0xFF005EEC),
                                                            size: 20,
                                                          ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text(
                                                    'Pilih Gambar disini, atau File',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Mendukung: JPG,PNG,HEIC',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            separator(),
                            TextFieldUnObs(
                                controller: controller,
                                textEditingController:
                                    controller.nameEditingController,
                                textInputType: TextInputType.name,
                                label: 'Nama Komunitas'),
                            const HintText(
                              content: 'Contoh: Impala Universitas Brawijaya',
                            ),
                            separator(),
                            TextFieldUnObs(
                                controller: controller,
                                textEditingController:
                                    controller.emailEditingController,
                                textInputType: TextInputType.emailAddress,
                                label: 'Email Komunitas'),
                            const HintText(
                              content: 'Contoh: impalaub@gmail.com',
                            ),
                            separator(),
                            TextFieldUnObs(
                                controller: controller,
                                textEditingController:
                                    controller.telpNumbeEditingController,
                                textInputType: TextInputType.number,
                                label: 'Telpon Komunitas'),
                            const HintText(
                              content: 'Contoh: 089237282',
                            ),
                            separator(),
                            TextFieldUnObs(
                                controller: controller,
                                textEditingController:
                                    controller.descriptionEditingController,
                                textInputType: TextInputType.text,
                                label: 'Deskripsi Komunitas'),
                            const HintText(
                              content:
                                  'Isi dengan kegiatan atau fokus komunitas',
                            ),
                            separator(),
                            GestureDetector(
                              onTap: () async {
                                controller.pickDocument();
                                controller.validate();
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                color: Colors.black.withOpacity(0.5),
                                strokeWidth: 1,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(17.5),
                                    child: Column(
                                      children: [
                                        Obx(
                                          () => Text(
                                            controller.isDocumentSelected.value
                                                ? path.basename(
                                                    controller.document!.path)
                                                : 'Dokumen Resmi Komunitas',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        DottedBorder(
                                          color: Colors.black.withOpacity(0.5),
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(10),
                                          strokeWidth: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(17.5),
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons.image,
                                                    color: Color(0xFF005EEC),
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const Text(
                                                    'Pilih Gambar disini, atau File',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Mendukung: PDF',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Contoh: SK Dari Rektorat atau Surat Izin Organisasi Berbadan Hukum',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            separator()
                          ],
                        ),
                      ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: Obx(
                      () => ElevatedButton(
                          onPressed: controller.index.value == 0
                              ? () => controller.index.value = 1
                              : controller.isValid.value
                                  ? () {}
                                  : null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          child: const Text(
                            'Daftar Komunitas',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Utils.verticalSeparator
                ],
              )
            ],
          ),
        ));
  }

  SizedBox separator() {
    return const SizedBox(
      height: 12,
    );
  }
}

class TextFieldUnObs extends StatelessWidget {
  const TextFieldUnObs(
      {super.key,
      required this.controller,
      required this.textEditingController,
      required this.textInputType,
      required this.label});

  final DaftarKomunitasController controller;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.validate(),
      controller: textEditingController,
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: const TextStyle(fontSize: 12),
          labelText: label),
    );
  }
}

class HintText extends StatelessWidget {
  const HintText({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 16,
        ),
        Text(
          content,
          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}
