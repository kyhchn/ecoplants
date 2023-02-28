// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/product_card.dart';
import 'package:ecoplants/view/widgets/top_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _searchController = TextEditingController().obs;
  final _index = 0.obs;
  final list = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        leadingOnPressed: () {},
        image: Image.asset('assets/images/logoWithoutText.png'),
        onSubmitted: (str) =>
            Get.toNamed(Routes.search, arguments: {'search': str}),
        size: size,
        searchController: _searchController,
        appBar: AppBar(),
      ),
      body: Stack(children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 110,
              ),
              Center(
                child: Text(
                  'Semua Event',
                  style: TextStyle(
                      fontSize: 14,
                      color: Utils.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) => Container(
                        width: size.width * 0.8,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(list.elementAt(index)),
                      ),
                  itemCount: list.length,
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    initialPage: list.length ~/ 2,
                    height: 115,
                    enableInfiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      _index.value = index;
                    },
                  )),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Populer',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lihat Semua',
                              style: TextStyle(
                                  fontSize: 10, color: Utils.primaryColor),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 210,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => const ProductCard(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 25,
                          ),
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Rekomendasi',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lihat Semua',
                              style: TextStyle(
                                  fontSize: 10, color: Utils.primaryColor),
                            ))
                      ],
                    ),
                    GridView.builder(
                      itemBuilder: (context, index) => const ProductCard(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 25,
                              crossAxisCount: 2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Utils.primaryColor,
              borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20),
                  bottomStart: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopCard(
                  asset: 'assets/images/promo_icon.png',
                  title: 'Promo',
                ),
                TopCard(
                  asset: 'assets/images/donasi_icon.png',
                  title: 'Donasi',
                ),
                TopCard(
                  asset: 'assets/images/komunitas_icon.png',
                  title: 'Komunitas',
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  height: 25,
                  width: 25,
                  color: _index.value == 0
                      ? Utils.primaryColor
                      : Colors.grey.withOpacity(0.9),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/donasi.svg',
                  height: 25,
                  width: 25,
                  color: _index.value == 1 ? Utils.primaryColor : null,
                ),
                label: 'Donasi'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/profil.svg',
                  height: 25,
                  width: 25,
                  color: _index.value == 2
                      ? Utils.primaryColor
                      : Colors.grey.withOpacity(0.9),
                ),
                label: 'Transaksi'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/transaksi.svg',
                  height: 25,
                  width: 25,
                  color: _index.value == 3 ? Utils.primaryColor : null,
                ),
                label: 'Profile'),
          ],
          onTap: (val) {
            _index.value = val;
          },
          currentIndex: _index.value,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
