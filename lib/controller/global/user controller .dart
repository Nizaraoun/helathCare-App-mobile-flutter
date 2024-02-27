// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_routes.dart';
import '../../view/authentification/login/login.dart';
import '../home/profile/image_picker_controller.dart';

class UserController extends GetxController {
  String? Nom;
  String? Phone = "";
  String? Mail = "";

  ImageControllerImp controller = Get.put(ImageControllerImp());

  GetUserinfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Nom = sharedPreferences.getString("nom");
    Phone = sharedPreferences.getString("phone");
    await controller.loadImage();
    update();
  }

// tafeskh el data eli fy cache w t5alihom null
  Logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("Status");
    sharedPreferences.remove("nom");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("mail");
    AppRoutes.login;
    print("logout");

    update();
  }
}
