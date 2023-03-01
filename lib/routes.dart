import 'package:ecoplants/view/carousel_page.dart';
import 'package:ecoplants/view/cart_page.dart';
import 'package:ecoplants/view/detail_product_page.dart';
import 'package:ecoplants/view/home_page.dart';
import 'package:ecoplants/view/login_page.dart';
import 'package:ecoplants/view/register_page.dart';
import 'package:ecoplants/view/search_page.dart';
import 'package:get/get.dart';

class Routes {
  static String carousel = '/carousel-page';
  static String login = '/login-page';
  static String register = '/resgister-page';
  static String homepage = '/home-page';
  static String search = '/search-page';
  static String detailProduct = '/detail-product-page';
  static String cart = '/cart-page';

  static List<GetPage> routes = [
    GetPage(name: carousel, page: () => CarouselPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: register, page: () => const RegisterPage()),
    GetPage(name: homepage, page: () => HomePage()),
    GetPage(name: search, page: () => SearchPage()),
    GetPage(name: detailProduct, page: () => const DetailProductPage()),
    GetPage(name: cart, page: () => const CartPage())
  ];
}
