// ignore_for_file: deprecated_member_use

import 'package:ecoplants/controller/home_controller.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/search_product_page.dart';
import 'package:ecoplants/view/widgets/home_body.dart';
import 'package:ecoplants/view/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final list = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = HomeController.i;
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          textFieldColor: controller.index.value != 0
              ? Colors.black.withOpacity(0.05)
              : Colors.white,
          onSubmitted: (str) {
            controller.searchController.text = '';
            Get.toNamed(Routes.search, arguments: {'search': str});
          },
          searchController: controller.searchController,
          appBar: AppBar(
            actionsIconTheme: IconThemeData(
                color: controller.index.value != 0
                    ? Colors.black.withOpacity(0.5)
                    : null),
            backgroundColor:
                controller.index.value != 0 ? Colors.white : Utils.primaryColor,
          ),
        ),
        body: Obx(() => controller.index.value == 0
            ? HomeBody(size: size, list: list)
            : controller.index.value == 1
                ? Container()
                : controller.index.value == 2
                    ? Column(
                        children: [
                          SizedBox(
                            height: 41,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            width: 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/Filter.svg'),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Filter',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )),
                                const SizedBox(
                                  width: 8,
                                ),
                                LabelItem(content: 'Terbaru'),
                                LabelItem(content: 'Gratis Ongkir'),
                                LabelItem(content: 'Official Store'),
                                LabelItem(content: 'Harga Terendah'),
                                LabelItem(content: 'Harga Tertinggi'),
                                LabelItem(content: 'Malang'),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                      width: double.infinity,
                                      height: 148,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8.5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.15)),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/dummy_seller.png'),
                                              const Text(
                                                'Tanaman store',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color: Utils.primaryColor
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'Pesanan Dikirim',
                                                  style: TextStyle(
                                                      color:
                                                          Utils.primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Kota Malang | Lowokwaru',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontSize: 8),
                                          ),
                                          Container(
                                            height: 1,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            width: double.infinity,
                                            color:
                                                Colors.black.withOpacity(0.05),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 54,
                                                width: 54,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.asset(
                                                  'assets/images/dummy_plant.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Monstera Varigata',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black
                                                            .withOpacity(0.8)),
                                                  ),
                                                  Text(
                                                    '1x Rp. 300.000',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                  Text(
                                                    'Catatan : Pacing Kayu',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Total Harga',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    Text(
                                                      'RP. 318.000',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.8)),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: Utils
                                                                    .primaryColor,
                                                                width: 1))),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Beli Lagi',
                                                      style: TextStyle(
                                                          color: Utils
                                                              .primaryColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 12,
                                    ),
                                itemCount: 10),
                          ))
                        ],
                      )
                    : const ProfileBody()),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/home.svg',
                    height: 25,
                    width: 25,
                    color: controller.index.value == 0
                        ? Utils.primaryColor
                        : Colors.grey.withOpacity(0.9),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/donasi.svg',
                    height: 25,
                    width: 25,
                    color:
                        controller.index.value == 1 ? Utils.primaryColor : null,
                  ),
                  label: 'Donasi'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/transaksi.svg',
                    height: 25,
                    width: 25,
                    color: controller.index.value == 2
                        ? Utils.primaryColor
                        : Colors.grey.withOpacity(0.9),
                  ),
                  label: 'Transaksi'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/profil.svg',
                    height: 25,
                    width: 25,
                    color:
                        controller.index.value == 3 ? Utils.primaryColor : null,
                  ),
                  label: 'Profile'),
            ],
            onTap: (val) {
              controller.index.value = val;
            },
            currentIndex: controller.index.value,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
