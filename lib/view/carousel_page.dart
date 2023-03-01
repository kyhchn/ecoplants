import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
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
                                    const EdgeInsets.symmetric(vertical: 12)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () => Get.toNamed(Routes.login),
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Jika belum memiliki akun',
                            style: TextStyle(fontSize: 10),
                          ),
                          TextButton(
                              onPressed: () => Get.toNamed(Routes.register),
                              child: const Text(
                                'Daftar',
                                style: TextStyle(fontSize: 10),
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
          OnboardingIndicator(index: _index),
        ],
      ),
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required RxInt index,
  }) : _index = index;

  final RxInt _index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Utils.primaryColor),
                color:
                    _index.value == 0 ? Colors.transparent : Utils.primaryColor,
                shape: BoxShape.circle),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Utils.primaryColor),
                color:
                    _index.value == 1 ? Colors.transparent : Utils.primaryColor,
                shape: BoxShape.circle),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: Border.all(color: Utils.primaryColor, width: 1),
                color:
                    _index.value == 2 ? Colors.transparent : Utils.primaryColor,
                shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
