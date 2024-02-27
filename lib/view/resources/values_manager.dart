import 'package:get/get.dart';

class AppMargin {
  static double m2 = calculateSize(2.0);
  static double m4 = calculateSize(4.0);
  static double m6 = calculateSize(6.0);
  static double m8 = calculateSize(8.0);
  static double m12 = calculateSize(12.0);
  static double m14 = calculateSize(14.0);
  static double m16 = calculateSize(16.0);
  static double m18 = calculateSize(18.0);
  static double m20 = calculateSize(20.0);
  static double m40 = calculateSize(40.0);
  static double m80 = calculateSize(80.0);
  static double m100 = calculateSize(100.0);
}

class AppPadding {
  static double defaultPadding = calculateSize(16.0);
  static double p1 = calculateSize(1.0);
  static double p2 = calculateSize(2.0);
  static double p4 = calculateSize(4.0);
  static double p6 = calculateSize(6.0);
  static double p8 = calculateSize(8.0);
  static double p12 = calculateSize(12.0);
  static double p14 = calculateSize(14.0);
  static double p16 = calculateSize(16.0);
  static double p18 = calculateSize(18.0);
  static double p20 = calculateSize(20.0);
  static double p40 = calculateSize(40.0);
}
/*class AppPadding {
  static double defaultPadding = calculateSize(16.0);
  static double p1 = calculateSize(1.0);
  static double p2 = calculateSize(2.0);
  static double p4 = calculateSize(4.0);
  static double p8 = calculateSize(8.0);
  static double p12 = calculateSize(12.0);
  static double p14 = calculateSize(14.0);
  static double p16 = calculateSize(16.0);
  static double p18 = calculateSize(18.0);
  static double p20 = calculateSize(20.0);
  static double p40 = calculateSize(40.0);
}*/

class AppSize {
  static double s0 = calculateSize(0);
  static double s1_5 = calculateSize(1.5);
  static double s4 = calculateSize(4.0);
  static double s8 = calculateSize(8.0);
  static double s12 = calculateSize(12.0);
  static double s14 = calculateSize(14.0);
  static double s16 = calculateSize(16.0);
  static double s17 = calculateSize(17.0);
  static double s18 = calculateSize(18.0);
  static double s20 = calculateSize(20.0);
  static double s22 = calculateSize(22.0);
  static double s25 = calculateSize(25.0);
  static double s27 = calculateSize(27.0);
  static double s28 = calculateSize(28.0);
  static double s30 = calculateSize(30.0);
  static double s35 = calculateSize(35.0);
  static double s40 = calculateSize(40.0);
  static double s45 = calculateSize(45.0);
  static double s50 = calculateSize(50.0);
  static double s60 = calculateSize(60.0);
  static double s100 = calculateSize(100.0);


}


/*double calculateSize(double baseSize) {
  double shortestSide = Get.size.shortestSide;

  if (shortestSide < 400) {
    return baseSize;
  } else if (shortestSide < 700) {
    return baseSize + ((baseSize - 20.0 ) * ((shortestSide - 400) / (700 - 400)));
  } else {
    return baseSize + ((baseSize - 20.0) * ((shortestSide - 700) / (1000 - 700))) + (20.0 - baseSize);
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
      return 0.85; // -15%
    } else if (screenWidth < normalPhone) {
      return 1.0; // default size
    } else if (screenWidth < largePhone) {
      return 1.1; // 10% larger than the smallest size
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
  return baseSize * scaleFactor();
}
/*
double calculateSize(double baseSize) {

  double scalingFactor = (Get.size.shortestSide* .75);

  // if (scalingFactor < 1) scalingFactor = 1;  // Ensure the scale is not less than 1
  // if (scalingFactor > 1.5) scalingFactor = 1.5; // Cap the scaling factor

  return baseSize * scalingFactor;
}*/
