import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: SizedBox(
        height: 210,
        width: 155,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Utils.turquoise.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2)),
                    ],
                    color: Utils.turquoise.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
                top: 30, child: Image.asset('assets/images/dummy_plant.png')),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: 155,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monstera Varigata',
                        style: TextStyle(
                            fontSize: 10, color: Colors.black.withOpacity(0.8)),
                      ),
                      const Text(
                        'Rp300.000',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                      Text(
                        'Jakarta Timur',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 11,
                          ),
                          Text(
                            '4.9 | Terjual 10',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                                fontSize: 6),
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
            )
          ],
        ),
      ),
    );
  }
}
