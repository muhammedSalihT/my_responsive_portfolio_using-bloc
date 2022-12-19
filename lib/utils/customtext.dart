import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.textWidth})
      : super(key: key);

  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWidth;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: textSize, fontWeight: textWidth),
    );
  }
}
