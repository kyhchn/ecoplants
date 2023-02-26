import 'package:ecoplants/utils.dart';
import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  String asset;
  String title;
  TopCard({super.key, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(asset),
          Text(
            title,
            style: TextStyle(fontSize: 8, color: Utils.primaryColor),
          )
        ],
      ),
    );
  }
}
