import 'package:ecoplants/model/product.dart';
import 'package:ecoplants/routes.dart';
import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.detailProduct, arguments: {'product': product}),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.black.withOpacity(0.1), width: 1)),
        child: SizedBox(
            height: 240,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.picture),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.1),
                  height: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 9.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black),
                        ),
                        Text(
                          Utils.convertToIdr(product.price),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                        Text(
                          'dummy location',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Text(
                              '${product.rating} | Terjual dummy',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/svg/love_icon.svg',
                              height: 12,
                              width: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
