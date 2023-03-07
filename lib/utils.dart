import 'package:flutter/material.dart';

class Utils {
  static MaterialColor primaryColor = const MaterialColor(0xFF4A9C80, {
    50: Color.fromRGBO(4, 131, 184, .1),
    100: Color.fromRGBO(4, 131, 184, .2),
    200: Color.fromRGBO(4, 131, 184, .3),
    300: Color.fromRGBO(4, 131, 184, .4),
    400: Color.fromRGBO(4, 131, 184, .5),
    500: Color.fromRGBO(4, 131, 184, .6),
    600: Color.fromRGBO(4, 131, 184, .7),
    700: Color.fromRGBO(4, 131, 184, .8),
    800: Color.fromRGBO(4, 131, 184, .9),
    900: Color.fromRGBO(4, 131, 184, 1),
  });

  static const Color turquoise = Color(0xFF4A9C80);
  static const Color grey = Color(0xFFD9D9D9);
  static const SizedBox verticalSeparator = SizedBox(
    height: 12,
  );
  static const baseUrl = "http://103.189.235.157:10006";
}
