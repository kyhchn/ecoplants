import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  bool isFilled;
  Circle({super.key, required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(100),
      decoration:
          const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    );
  }
}
