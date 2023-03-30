import 'package:flutter/material.dart';
import 'package:responsive_portfolio/constents/sized_boxes.dart';
import 'package:responsive_portfolio/utils/customtext.dart';
import 'package:responsive_portfolio/utils/responsive.dart';

class AnimatedIndicators {
  static Widget animatedCircularIndicator(
      {required String label,
      required double percentage,
      required BuildContext context}) {
    Size size = Responsive.getScreenSize(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: const Duration(seconds: 5),
              builder: (context, double percentage, child) => Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: percentage,
                    color: Colors.orangeAccent,
                    backgroundColor: Colors.grey,
                  ),
                  Center(
                      child: CustomTextWidget(
                    textSize: 20,
                    text: "${(percentage * 100).toInt()}%",
                  )),
                ],
              ),
            ),
          ),
          Box.minHeightBox,
          CustomTextWidget(
            text: label,
            textSize: 15,
            textWidth: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  static Widget animtedLinerIndicator(
      {required String label,
      required double percentage,
      required BuildContext context}) {
    Size size = Responsive.getScreenSize(context);
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: const Duration(seconds: 5),
      builder: (context, double percentage, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,
                child: CustomTextWidget(
                  text: label,
                  textSize: 15,
                  textWidth: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  value: percentage,
                  color: Colors.orangeAccent,
                  backgroundColor: Colors.grey,
                ),
              ),
              Center(
                child: CustomTextWidget(
                  textSize: 15,
                  textWidth: FontWeight.w600,
                  text: "${(percentage * 100).toInt()}%",
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
