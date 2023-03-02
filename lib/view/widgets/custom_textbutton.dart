import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.content,
      required this.textStyle,
      required this.onPressed});
  String content;
  TextStyle textStyle;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero,
        ),
        onPressed: onPressed,
        child: Text(
          content,
          style: textStyle,
        ));
  }
}
