
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double screenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  // Mobile screen categories

  static bool isSmallMobile(BuildContext context) {
    return screenWidth(context) <= 360;
  }

  static bool isNormalMobile(BuildContext context) {
    final width = screenWidth(context);
    return width > 360 && width <= 400;
  }

  static bool isLargeMobile(BuildContext context) {
    return screenWidth(context) > 400;
  }

  // Responsive horizontal padding

  static double horizontalPadding(BuildContext context) {
    final width = screenWidth(context);

    if (width <= 360) return 12;
    if (width <= 400) return 16;

    return 20;
  }

  // Responsive spacing

  static double spacing(BuildContext context) {
    final width = screenWidth(context);

    if (width <= 360) return 8;
    if (width <= 400) return 12;

    return 16;
  }
}
