import 'package:ecoplants/controller/search_controller.dart';
import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_appbar.dart';
import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});
  Product product = Get.arguments['product'];
  @override
  Widget build(BuildContext context) {
    SearchController controller;
    try {
      controller = SearchController.i;
    } catch (e) {
      controller = Get.put(SearchController(str: 'detail produk'));
    }
    return Scaffold(
      appBar: CustomAppBar(
        textFieldColor: const Color(0xFF525A67).withOpacity(0.05),
        leadingWidget: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.5),
            ),
            splashColor: Colors.transparent),
        appBar: AppBar(
          actionsIconTheme:
              IconThemeData(color: Colors.black.withOpacity(0.5), size: 22),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
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
        ),
        searchController: controller.searchController,
        onSubmitted: (str) {},
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
              height: 216,
              width: double.infinity,
              child: Image.network(
                product.picture,
                fit: BoxFit.cover,
              )),
          Utils.verticalSeparator,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Utils.formatIDR.format(300000),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SvgPicture.asset(
                      'assets/svg/love_icon.svg',
                      height: 22,
                      width: 22,
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Monstera Varigata',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Jakarta Timur | Kebayoran Lama',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 22,
                    ),
                    Text(
                      '4.9 | Terjual 10',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Utils.verticalSeparator,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/dummy_seller.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 6.5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tanaman Store',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Online',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Malang | Lowokwaru',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(59, 23),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Utils.primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          'Ikuti',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Utils.primaryColor,
                          ),
                        ))
                  ],
                ),
                Utils.verticalSeparator,
                const Text(
                  'Detail Produk',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                DetailProductItem(
                  parameter: 'Kondisi Baru',
                  value: 'Baru',
                ),
                DetailProductItem(parameter: 'Min.Pemesanan', value: '1 Buah'),
                DetailProductItem(parameter: 'Kategori', value: 'Tanaman'),
                Utils.verticalSeparator,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi Produk',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 10),
                    )
                  ],
                ),
                Utils.verticalSeparator,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ulasan Pembeli',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            child: const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 22,
                        ),
                        const Text(
                          '4.9',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '100 Ulasan',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 8),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/dummy_plant.png',
                          height: 65,
                          width: 65,
                        ),
                        Image.asset(
                          'assets/images/dummy_plant.png',
                          height: 65,
                          width: 65,
                        ),
                        Image.asset(
                          'assets/images/dummy_plant.png',
                          height: 65,
                          width: 65,
                        ),
                        Image.asset(
                          'assets/images/dummy_plant.png',
                          height: 65,
                          width: 65,
                        ),
                      ],
                    ),
                  ],
                ),
                Utils.verticalSeparator,
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('assets/images/dummy_seller.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Uciha Ikbal'),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 48,
                              height: 8,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 10,
                                ),
                                itemCount: 5,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '1 Hari lalu',
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Utils.verticalSeparator,
                Text(
                  'Sangat membantu sekali untuk membeli tanaman jadi tidak usah pergi ke toko secala langsung, pengiriman aman dan cepat. Terimakasih.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 8),
                ),
                Utils.verticalSeparator,
                Container(
                  color: Colors.black.withOpacity(0.2),
                  width: double.infinity,
                  height: 0.2,
                  
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailProductItem extends StatelessWidget {
  DetailProductItem({super.key, required this.parameter, required this.value});
  String parameter;
  String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              parameter,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 8),
            ),
            Text(
              value,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 8),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 0.2,
          width: double.infinity,
          color: Colors.black.withOpacity(0.2),
        )
      ],
    );
  }
}
