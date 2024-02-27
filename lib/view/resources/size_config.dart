import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SizeUtil {
  double screenWidth = Get.width;
  double screenHeight = Get.height;

  double smallPhone = 320.0;
  double normalPhone = 375.0;
  double largePhone = 414.0;
  double smallTablet = 600.0;
  double normalTablet = 720.0;
  double largeTablet = 850.0;

  double calculateHeight(double percentage) {
    double adjustedPercentage = percentage * _getFactorForHeight();
    return screenHeight * adjustedPercentage;
  }

  double calculateWidth(double percentage) {
    double adjustedPercentage = percentage * _getFactorForWidth();
    return screenWidth * adjustedPercentage;
  }
  double calculateRadius(double radius) {
    return radius * _getFactorForRadius();
  }
  Size calculateButtonSize(double size) {
    return Size(
      calculateWidth(size) * _getFactorForButtonSize(),
      calculateHeight(size) * _getFactorForButtonSize(),
      // SizeUtil().calculateWidth(.1),
      // SizeUtil().calculateHeight(.1),
    );
  }

  double _getFactorForHeight() {
    if (screenWidth < smallPhone) {
      return 1.1; // -15%
    } else if (screenWidth < normalPhone) {
      return  1; // default size
    } else if (screenWidth < largePhone) {
      return 0.99; // 10% larger
    } else if (screenWidth < smallTablet) {
      return 0.98;  // 20% larger
    } else if (screenWidth < normalTablet) {
      return 0.97;  // 30% larger
    } else if (screenWidth < largeTablet) {
      return 0.96;  // 40% larger
    } else {
      return 0.95; // 50% larger
    }
  }

  double _getFactorForWidth() {
    if (screenWidth < smallPhone) {
      return 1.1; // -15%
    } else if (screenWidth < normalPhone) {
      return 1; // default size
    } else if (screenWidth < largePhone) {
      return 0.96; // 10% larger
    } else if (screenWidth < smallTablet) {
      return 0.92;  // 20% larger
    } else if (screenWidth < normalTablet) {
      return 0.88;  // 30% larger
    } else if (screenWidth < largeTablet) {
      return 0.84;  // 40% larger
    } else {
      return 0.8; // 50% larger
    }
  }

  double _getFactorForRadius() {
    if (screenWidth < smallPhone) {
      return 0.85; // -15%
    } else if (screenWidth < normalPhone) {
      return  1; // default size
    } else if (screenWidth < largePhone) {
      return 1.1; // 10% larger
    } else if (screenWidth < smallTablet) {
      return 1.2;  // 20% larger
    } else if (screenWidth < normalTablet) {
      return 1.3;  // 30% larger
    } else if (screenWidth < largeTablet) {
      return 1.4;  // 40% larger
    } else {
      return 1.5; // 50% larger
    }
  }

  double _getFactorForButtonSize() {
    if (screenWidth < smallPhone) {
      return 0.85; // -15%
    } else if (screenWidth < normalPhone) {
      return  1; // default size
    } else if (screenWidth < largePhone) {
      return 1.08; // 10% larger
    } else if (screenWidth < smallTablet) {
      return 1.16;  // 20% larger
    } else if (screenWidth < normalTablet) {
      return 1.24;  // 30% larger
    } else if (screenWidth < largeTablet) {
      return 1.32;  // 40% larger
    } else {
      return 1.4; // 50% larger
    }
  }
}


