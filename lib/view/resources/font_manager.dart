import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FontConstants {
  static const String fontFamily = "Montserrat";
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {


  static double get s8 => calculateSize(8.0);
  static double get s12 => calculateSize(12.0);
  static double get s14 => calculateSize(14.0);
  static double get s16 => calculateSize(16.0);
  static double get s17 => calculateSize(17.0);
  static double get s18 => calculateSize(18.0);
  static double get s20 => calculateSize(20.0);
  static double get s22 => calculateSize(22.0);
  static double get s24 => calculateSize(24.0);
  static double get s26 => calculateSize(26.0);
  static double get s30 => calculateSize(30.0);
  static double get s35 => calculateSize(35.0);
  static double get s40 => calculateSize(40.0);
  static double get s45 => calculateSize(45.0);
  static double get s50 => calculateSize(50.0);
  static double get s100 => calculateSize(100.0);
  static double get s200 => calculateSize(200.0);


}

/*
double calculateSize(double baseSize) {
  double shortestSide = Get.size.shortestSide;

  if (shortestSide < 400) {
    return baseSize;
  } else if (shortestSide < 700) {
    return baseSize + ((20.0 - baseSize) * ((shortestSide - 400) / (700 - 400)));
  } else {
    return baseSize + ((25.0 - 20.0) * ((shortestSide - 700) / (1000 - 700))) + (20.0 - baseSize);
  }
}*/
double calculateSize(double baseSize) {

  const double smallPhone = 320.0;  // e.g., iPhone SE
  const double normalPhone = 375.0; // e.g., iPhone X, iPhone 11 Pro
  const double largePhone = 414.0;  // e.g., iPhone XS Max, iPhone 11 Pro Max
  const double smallTablet = 600.0; // e.g., Google Pixel C, Samsung Tab
  const double normalTablet = 720.0; // e.g., iPad, iPad Pro (10.5-inch)
  const double largeTablet = 850.0; // e.g., iPad, iPad Pro (10.5-inch)

  // Assuming default scaling is based on smallPhone. You can adjust as necessary.
  double scaleFactor() {
    double screenWidth = Get.width;

    if (screenWidth < smallPhone) {
      return 0.85; // default size
    } else if (screenWidth < normalPhone) {
      return 1.0; // default size
    } else if (screenWidth < largePhone) {
      return 1.075; // 15% larger than the smallest size
    } else if (screenWidth < smallTablet) {
      return 1.15;  // 30% larger
    } else if (screenWidth < normalTablet) {
      return 1.225;  // 50% larger
    } else if (screenWidth < largeTablet) {
      return 1.3;  // 50% larger
    } else {
      return 1.375; // 75% larger
    }
  }
  return baseSize * scaleFactor();
}
/*double calculateSize(double baseSize) {
  double screenWidth = Get.size.width;
  double screenHeight = Get.size.height;

  double scalingFactor = (screenWidth < screenHeight ? screenWidth : screenHeight) / (Get.size.shortestSide* .9);
  // double scalingFactor = (Get.size.shortestSide < 400 ?(Get.size.shortestSide / 400) : Get.size.shortestSide < 700 ?  (Get.size.shortestSide / 700): screenHeight / (Get.size.shortestSide* .9));
  // if (scalingFactor < 1) scalingFactor = 1;  // Ensure the scale is not less than 1
  // if (scalingFactor > 1.5) scalingFactor = 1.5; // Cap the scaling factor

  return baseSize * SizeConfig.textMultiplier;
}*/
