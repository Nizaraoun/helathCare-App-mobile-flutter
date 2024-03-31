import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/global/check_internet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/geolocation.dart';
import '../../utils/app_routes.dart';
import '../../utils/global/snackError.dart';
import '../global/user controller .dart';
import '../home/home_page/homepagecontorller.dart';

abstract class Internetcontroller extends GetxController {
  String? resStatus;
  var res = false;
  initiadata();
  Future<LocationModel> determinePosition();
  UserController controller = Get.put(UserController());
  HomePageControllerimp controller2 = Get.put(HomePageControllerimp());
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
  initiadata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    resStatus = sharedPreferences.getString("token");
    res = await checkInternet();

    Timer(const Duration(seconds: 3), () async {
      if (res == true) {
        if (resStatus != null) {
          await controller.GetUserinfo();
          await controller.MyLocation();
          AppRoutes().goToEnd(AppRoutes.home);
          update();
        } else {
          AppRoutes().goToEnd(AppRoutes.home);
          update();
        }
      } else {
        Get.snackbar(
          "خطأ",
          "الرجاء التحقق من الاتصال بالانترنت",
          boxShadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          animationDuration: const Duration(seconds: 2),
          titleText: const Text(
            "خطأ",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 4, 4),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: const Duration(seconds: 2),
          overlayBlur: 2,
        );
      }
    });

    update();
  }
}
