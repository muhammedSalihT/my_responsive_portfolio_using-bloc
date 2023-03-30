import 'package:flutter/cupertino.dart';

class Responsive {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static bool isLargeScreenMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 700;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 700;
  }
}
