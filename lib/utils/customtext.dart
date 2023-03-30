import 'package:flutter/material.dart';
import 'package:responsive_portfolio/utils/responsive.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.textWidth,
      this.textOverFlow,
      this.textHeight})
      : super(key: key);

  final String text;
  final TextOverflow? textOverFlow;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWidth;
  final double? textHeight;
  @override
  Widget build(BuildContext context) {
    Size size = Responsive.getScreenSize(context);
    return Text(
      overflow: textOverFlow,
      text,
      style: TextStyle(
          overflow: textOverFlow,
          height: textHeight,
          color: textColor ?? Colors.black,
          fontSize: textSize ?? 20,
          fontWeight: textWidth),
    );
  }
}
