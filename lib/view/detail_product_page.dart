import 'package:ecoplants/controller/search_controller.dart';
import 'package:ecoplants/view/widgets/custom_appbar.dart';
import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    return Scaffold(
      appBar: CustomAppBar(
          textFieldColor: const Color(0xFF525A67).withOpacity(0.05),
          leadingWidget: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black.withOpacity(0.5),
              ),
              splashColor: Colors.transparent),
          appBar: AppBar(
            actionsIconTheme:
                IconThemeData(color: Colors.black.withOpacity(0.5), size: 22),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              StackIcon(
                  iconData: Icons.shopping_cart_checkout_outlined, quantity: 5),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.menu),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          searchController: controller.searchController,
          onSubmitted: (str) {}),
    );
  }
}
