import 'package:ecoplants/bindings/carousel_binding.dart';
import 'package:ecoplants/bindings/cart_binding.dart';
import 'package:ecoplants/bindings/home_binding.dart';
import 'package:ecoplants/bindings/login_binding.dart';
import 'package:ecoplants/bindings/register_binding.dart';
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
    GetPage(
        name: carousel, page: () => CarouselPage(), binding: CarouselBinding()),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: homepage,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: search, page: () => SearchPage()),
    GetPage(name: detailProduct, page: () => const DetailProductPage()),
    GetPage(
        name: cart,
        page: () => const CartPage(),
        binding: CartBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
