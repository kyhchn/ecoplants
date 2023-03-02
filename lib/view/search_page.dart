import 'package:ecoplants/controller/search_controller.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_appbar.dart';
import 'package:ecoplants/view/widgets/product_card.dart';
import 'package:ecoplants/view/widgets/stack_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController(str: Get.arguments['search']));
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
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
                  IconThemeData(color: Colors.black.withOpacity(0.5), size: 24),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                StackIcon(
                    iconData: Icons.shopping_cart_checkout_outlined,
                    quantity: 5),
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
        body: Column(
          children: [
            Row(
              children: [
                TabItem(
                  controller: controller,
                  isProduct: true,
                  size: size,
                  content: 'Produk',
                ),
                TabItem(
                  controller: controller,
                  size: size,
                  isProduct: false,
                  content: 'Toko',
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => Body(
                isProduct: controller.isProduct.value,
              ),
            )
          ],
        ));
  }
}

class Body extends StatelessWidget {
  Body({super.key, required this.isProduct});
  bool isProduct;

  @override
  Widget build(BuildContext context) {
    if (isProduct) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 240 / 160,
                mainAxisExtent: 243,
                mainAxisSpacing: 20,
                crossAxisCount: 2),
            itemBuilder: (context, index) => const ProductCard(),
          ),
        ),
      );
    }
    return SizedBox();
  }
}

class TabItem extends StatelessWidget {
  TabItem(
      {super.key,
      required this.controller,
      required this.isProduct,
      required this.size,
      required this.content});

  final SearchController controller;
  final Size size;
  bool isProduct;
  String content;

  @override
  Widget build(BuildContext context) {
    Color activeColor, disabledColor, textDisabledColor, textEnableColor;
    if (isProduct) {
      activeColor = Utils.primaryColor;
      disabledColor = Colors.black.withOpacity(0.2);
      textDisabledColor = Colors.black.withOpacity(0.5);
      textEnableColor = activeColor;
    } else {
      activeColor = Colors.black.withOpacity(0.2);
      disabledColor = Utils.primaryColor;
      textEnableColor = Colors.black.withOpacity(0.5);
      textDisabledColor = disabledColor;
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.isProduct.value = isProduct;
      },
      child: SizedBox(
        width: size.width * 0.5,
        height: 45,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Obx(
                  () => Text(
                    content,
                    style: TextStyle(
                      color: controller.isProduct.value
                          ? textEnableColor
                          : textDisabledColor,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                width: double.infinity,
                height: 2,
                color: controller.isProduct.value ? activeColor : disabledColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
