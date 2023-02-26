import 'package:flutter/material.dart';

class StackIcon extends StatelessWidget {
  IconData iconData;
  int quantity;
  StackIcon({super.key, required this.quantity, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Icon(iconData),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/images/icon_count.png'),
          ),
          Positioned(
            top: 0,
            right: 3,
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}