// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/stack_icon.dart';

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
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/logoWithoutText.png')),
        title: SizedBox(
          width: size.width * 0.5,
          height: 25,
          child: TextField(
            style: const TextStyle(fontSize: 10),
            textAlignVertical: TextAlignVertical.center,
            controller: _searchController.value,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 10, bottom: 0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.5),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintText: 'Cari tanaman favorit',
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        actionsIconTheme: const IconThemeData(size: 22),
        actions: [
          StackIcon(iconData: Icons.email_outlined, quantity: 5),
          const SizedBox(
            width: 10,
          ),
          StackIcon(iconData: Icons.notifications_none_outlined, quantity: 5),
          const SizedBox(
            width: 10,
          ),
          StackIcon(
              iconData: Icons.shopping_cart_checkout_outlined, quantity: 5),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.menu),
          const SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Event Donasi Lingkungan',
                  style: TextStyle(
                      fontSize: 14,
                      color: Utils.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 20,
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
                              child: const Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 210,
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                const ProductCard(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 25,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
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
                              child: const Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ))
                        ],
                      ),
                      SizedBox(
                          height: 210,
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                const ProductCard(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 25,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: SizedBox(
        height: 210,
        width: 155,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Utils.turquoise.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2)),
                    ],
                    color: Utils.turquoise.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
                top: 30, child: Image.asset('assets/images/dummy_plant.png')),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: 155,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monstera Varigata',
                        style: TextStyle(
                            fontSize: 10, color: Colors.black.withOpacity(0.8)),
                      ),
                      const Text(
                        'Rp300.000',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                      Text(
                        'Jakarta Timur',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 11,
                          ),
                          Text(
                            '4.9 | Terjual 10',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                                fontSize: 6),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/svg/love_icon.svg',
                            height: 12,
                            width: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  String asset;
  String title;
  TopCard({super.key, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(asset),
          Text(
            title,
            style: TextStyle(fontSize: 8, color: Utils.primaryColor),
          )
        ],
      ),
    );
  }
}
