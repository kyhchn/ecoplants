import 'package:ecoplants/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final searchController =
      TextEditingController(text: Get.arguments['search']).obs;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
          leadingOnPressed: () => Get.back(),
          image: const Icon(Icons.arrow_back),
          size: size,
          appBar: AppBar(),
          searchController: searchController,
          onSubmitted: (str) {}),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ),
    );
  }
}
