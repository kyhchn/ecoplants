import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class CarouselBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CarouselController());
  }
}
