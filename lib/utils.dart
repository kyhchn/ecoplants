import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  static const Color red = Color(0xFFDA1919);
  static const Color grey = Color(0xFFD9D9D9);
  static const SizedBox verticalSeparator = SizedBox(
    height: 12,
  );
  static const baseUrl = "https://nurfattah.aenzt.tech";
  static String convertToIdr(int amount) {
    String result = 'Rp ${amount.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)}.',
        )}';
    return result;
  }

  static GetSnackBar getSnackBar(String message) {
    return GetSnackBar(
      message: message,
      duration: const Duration(seconds: 2),
    );
  }

  static String getDayOfWeeks(int day) {
    String dayOfWeek = '';
    switch (day) {
      case 1:
        dayOfWeek = "Minggu";
        break;
      case 2:
        dayOfWeek = "Senin";
        break;
      case 3:
        dayOfWeek = "Selasa";
        break;
      case 4:
        dayOfWeek = "Rabu";
        break;
      case 5:
        dayOfWeek = "Kamis";
        break;
      case 6:
        dayOfWeek = "Jumat";
        break;
      case 7:
        dayOfWeek = "Sabtu";
        break;
    }
    return dayOfWeek;
  }
}
