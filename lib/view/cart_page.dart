import 'package:ecoplants/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Keranjang'),
        actions: [Icon(Icons.menu)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [Text('Total Tagihan'), Text('val')],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Beli (val)'))
            ],
          )
        ],
      ),
    );
  }
}
