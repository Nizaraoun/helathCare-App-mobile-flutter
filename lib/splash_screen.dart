import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/authentification/otp/internet_connection-controller.dart';
import 'controller/global/user controller .dart';
import 'controller/home/home_page/homepagecontorller.dart';
import 'controller/home/profile/image_picker_controller.dart';
import 'controller/shared preferences/connection controller.dart';
import 'utils/geolocation/postion.dart';
import 'view/resources/color/color_manager.dart';
import 'widgets/customtext.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Internetcontroller controller = Get.put(Internetcontrollerimp());
  UserController controller2 = Get.put(UserController());
  HomePageControllerimp contoller3 = Get.put(HomePageControllerimp());

  @override
  void initState() {
    setState(() {
      controller.initiadata();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo app
            CustomTextWidget(
              Txt: "Sah",
              color: ColorManager.white,
              size: Get.width * 0.15,
              fontweight: FontWeight.bold,
              spacing: 2,
            ),
            CustomTextWidget(
              Txt: "Tech",
              color: ColorManager.red,
              size: Get.width * 0.15,
              fontweight: FontWeight.bold,
              spacing: 2,
            ),
          ],
        ),
      ),
    );
  }
}
