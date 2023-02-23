import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/carousel_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EcoPlants',
        theme: ThemeData(
          primarySwatch: Utils.primaryColor,
        ),
        home: CarouselPage());
  }
}
