import 'package:ecoplants/view/carousel_page.dart';
import 'package:ecoplants/view/home_page.dart';
import 'package:ecoplants/view/login_page.dart';
import 'package:ecoplants/view/register_page.dart';
import 'package:get/get.dart';

class Routes {
  static String carousel = '/carousel-page';
  static String login = '/login-page';
  static String register = '/resgister-page';
  static String homepage = '/home-page';

  static String getCarouselRoute() => carousel;
  static String getLoginRoute() => login;
  static String getRegisterRoute() => register;
  static String getHomePageRoute() => homepage;

  static List<GetPage> routes = [
    GetPage(name: carousel, page: () => CarouselPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: homepage, page: () => HomePage())
  ];
}
