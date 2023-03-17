import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KomunitasPage extends StatelessWidget {
  const KomunitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.daftarKomunitas),
          elevation: 0,
          backgroundColor: Utils.primaryColor,
          child: const Icon(
            Icons.add,
            size: 50,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black.withOpacity(0.5),
                size: 24,
              )),
          title: Text(
            'Komunitas',
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            itemBuilder: (context, index) => KomunitasItem(),
            separatorBuilder: (context, index) => SizedBox(
                  height: 21,
                ),
            itemCount: 10));
  }
}

class KomunitasItem extends StatelessWidget {
  const KomunitasItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Komunitas Pecinta Alam Malang',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'Terverifikasi',
                style: TextStyle(
                    color: Utils.primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/impala.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi Komunitas',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Komunitas Pecinta Alam yang berpartisipasi dalam berbagai kegiatan sosial di Malang Raya.',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10),
                    ),
                    const Text(
                      'Jumlah Anggota',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '100 Anggota',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kegiatan',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '5 Kegiatan Donasi',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.5)),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.5, horizontal: 9.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(color: Utils.primaryColor, width: 1))),
                  child: Text(
                    'Lihat Kegiatan',
                    style: TextStyle(
                        color: Utils.primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
