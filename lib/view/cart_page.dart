import 'package:ecoplants/controller/cart_controller.dart';
import 'package:ecoplants/model/cart.dart';
import 'package:ecoplants/utils.dart';
import 'package:ecoplants/view/widgets/custom_textbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.i;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.5)),
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          'Keranjang',
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.menu_sharp,
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isSelectAll.value,
                            onChanged: (value) {
                              controller.isSelectAll.value = value!;
                            },
                          ),
                        ),
                        Text(
                          'Pilih semua',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Expanded(
                        child: Obx(
                      () => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => CartItem(
                              controller: controller,
                              cart: controller.carts.elementAt(index).obs,
                              index: index),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          itemCount: controller.carts.length),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Tagihan',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'val',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 115,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {},
                              child: const Text('Beli (val)')),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.controller,
      required this.cart,
      required this.index});

  final CartController controller;
  final Rx<Cart> cart;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: Utils.grey.withOpacity(0.8)),
      ),
      padding: const EdgeInsets.only(right: 12),
      height: 158,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isChecked.elementAt(index),
                  onChanged: (value) {
                    controller.isChecked[index] = value!;
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/dummy_seller.png'),
                      Text(
                        cart.value.product.merchant,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Text(
                    '${cart.value.product.regency} | ${cart.value.product.district}',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 8),
                  )
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isChecked.elementAt(index),
                  onChanged: (value) {
                    controller.isChecked[index] = value!;
                  },
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Utils.grey.withOpacity(0.3),
                          )),
                      width: 58,
                      height: 58,
                      child: Image.network(
                        cart.value.product.picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cart.value.product.name,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          Utils.convertToIdr(cart.value.product.price),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  onPressed: () {},
                  content: 'Tulis Catatan',
                  textStyle: TextStyle(fontSize: 10, color: Utils.primaryColor),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await controller.deleteItem(cart.value.product.iD);
                      },
                      icon: Icon(
                        CupertinoIcons.trash,
                        size: 18,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      splashRadius: 20,
                    ),
                    Container(
                      width: 79,
                      height: 24,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Utils.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextButton(
                            onPressed: () {
                              if (cart.value.quantity != 1) {
                                cart.value.quantity--;
                              }
                            },
                            content: '-',
                            textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Utils.grey),
                          ),
                          Obx(
                            () => Text(
                              controller.carts
                                  .elementAt(index)
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                          ),
                          CustomTextButton(
                            onPressed: () {
                              controller.carts.elementAt(index).quantity++;
                            },
                            content: '+',
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Utils.primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
