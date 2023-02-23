import 'package:ecoplants/view/carousel_page.dart';
import 'package:ecoplants/view/login_page.dart';
import 'package:get/get.dart';

class Routes {
  static String carousel = '/carousel-page';
  static String login = '/login-page';

  static String getCarouselRoute() => carousel;
  static String getLoginRoute() => login;

  static List<GetPage> routes = [
    GetPage(name: carousel, page: () => CarouselPage()),
    GetPage(name: login, page: () => LoginPage())
  ];
}
