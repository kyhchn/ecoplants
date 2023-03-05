import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselPage extends StatelessWidget {
  CarouselPage({super.key});
  final _index = 0.obs;
  @override
  Widget build(BuildContext context) {
    final carouselController = Get.find<CarouselController>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Obx(
            () => SkipButton(
                carouselController: carouselController, index: _index.value),
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
                carouselController: carouselController,
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 12)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
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
                            'Belum punya akun? ',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                          CustomTextButton(
                              content: 'Daftar',
                              textStyle: const TextStyle(fontSize: 10),
                              onPressed: () => Get.toNamed(Routes.register))
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

class SkipButton extends StatelessWidget {
  const SkipButton(
      {super.key, required this.carouselController, required this.index});

  final CarouselController carouselController;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 2) return const SizedBox();
    return TextButton(
      onPressed: () {
        carouselController.animateToPage(2);
      },
      child: const Text(
        'skip',
        style: TextStyle(color: Colors.black, fontSize: 16),
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
