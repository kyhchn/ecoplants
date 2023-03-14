import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationDetailPage extends StatelessWidget {
  const DonationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          height: size.height * 0.77,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text("Modal content goes here"),
                          ),
                        ),
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
