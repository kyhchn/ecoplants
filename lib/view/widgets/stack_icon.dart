import 'package:flutter/material.dart';

class StackIcon extends StatelessWidget {
  IconData iconData;
  void Function()? onPressed;
  int quantity;
  StackIcon(
      {super.key,
      required this.quantity,
      required this.iconData,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Icon(iconData),
            Positioned(
              top: 0,
              right: 1.5,
              child: Image.asset(
                'assets/images/icon_count.png',
                width: 10,
                height: 15,
              ),
            ),
            Positioned(
              top: 0,
              right: 3,
              child: Text(
                '$quantity',
                style:
                    const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
