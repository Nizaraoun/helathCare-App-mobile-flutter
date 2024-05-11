import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/global/check_internet.dart';
import '../../model/geolocation.dart';
import '../../utils/app_routes.dart';
import '../../utils/global/snack_error.dart';
import '../../utils/global/userdata.dart';
import '../global/user controller .dart';
import '../home/home_page/homepagecontorller.dart';
import '../home/profile/image_picker_controller.dart';

abstract class Internetcontroller extends GetxController {
  String? resStatus;
  initiadata();
  Future<LocationModel> determinePosition();
  UserController controller = Get.put(UserController());
  HomePageControllerimp controller2 = Get.put(HomePageControllerimp());
  ImageControllerImp controller3 = Get.put(ImageControllerImp());
}

class Internetcontrollerimp extends Internetcontroller {
  @override
  Future<LocationModel> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show error message and return null.
      return showSnackError("الرجاء تفعيل خدمات الموقع الجغرافي", " عفواا");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, show error message and return null.
        return showSnackError(
            "الرجاء السماح بالوصول الى الموقع الجغرافي ", " عفواا");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, show error message and return null.
      return showSnackError(
          "الرجاء السماح بالوصول الى الموقع الجغرافي من الاعدادات ", " عفواا");
    }
    Position position = await Geolocator.getCurrentPosition();
    return LocationModel(
        latitude: position.latitude, longitude: position.longitude);
  }

  @override
  // the function that will be called in the splash screen
  initiadata() async {
    // get token
    resStatus = await UserData.getToken();
    // check internet connection
    // res = await checkInternet();

    Timer(const Duration(seconds: 3), () async {
   
        if (resStatus != null) {
          // get user info
          await controller.GetUserinfo();
          // get user location
          await controller.MyLocation();
          // load image
          await controller3.loadImage();
          // go to home page
          AppRoutes().goToEnd(AppRoutes.home);
          update();
        } else {
          // go to login page
          AppRoutes().goToEnd(AppRoutes.welcomePage);
          update();
        
      } 
    });

    update();
  }
}
