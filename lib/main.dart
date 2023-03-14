import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final token = GetStorage().read('token');
    return GetMaterialApp(
      getPages: Routes.routes,
      initialRoute: token != null ? Routes.paymentDetail : Routes.detailProduct,
      title: 'EcoPlants',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        primarySwatch: Utils.primaryColor,
      ),
    );
  }
}
