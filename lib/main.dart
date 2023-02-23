import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/carousel_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Routes.routes,
      initialRoute: Routes.getCarouselRoute(),
      title: 'EcoPlants',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Utils.primaryColor,
      ),
    );
  }
}
