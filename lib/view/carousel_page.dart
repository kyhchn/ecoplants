import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselPage extends StatelessWidget {
  CarouselPage({super.key});
  final _index = 0.obs;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'skip',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(
            height: size.height * 0.1,
          ),
          SizedBox(
            height: size.height * 0.5,
            child: CarouselSlider(
                items: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/carousel_img1.png'),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Image.asset('assets/images/carousel_txt1.png'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/carousel_img2.png'),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Image.asset('assets/images/carousel_txt2.png'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/carousel_img3.png'),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      SizedBox(
                        width: size.width * 0.55,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 12)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () {},
                            child: const Text(
                              'Masuk',
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Jika belum memiliki akun'),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Daftar',
                                style: TextStyle(color: Colors.green),
                              ))
                        ],
                      )
                    ],
                  ),
                ],
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: size.height * 0.4,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    _index.value = index;
                  },
                )),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      color:
                          _index.value == 0 ? Colors.transparent : Colors.green,
                      shape: BoxShape.circle),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      color:
                          _index.value == 1 ? Colors.transparent : Colors.green,
                      shape: BoxShape.circle),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      color:
                          _index.value == 2 ? Colors.transparent : Colors.green,
                      shape: BoxShape.circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
