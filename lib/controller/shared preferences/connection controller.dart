import 'dart:async';

import 'package:get/get.dart';
import 'package:sahtech/utils/global/check_internet.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/authentification/onboarding.dart';
import '../../view/authentification/signup/signup.dart';
import '../../view/home/home page/home.dart';
import '../global/user controller .dart';

class Internetcontroller extends GetxController {
  var res;

  UserController controller = Get.put(UserController());
  initiadata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? ResStatus = sharedPreferences.getString("nom");

    res = await checkInternet();

    Timer(const Duration(seconds: 3), () {
      if (res == true) {
        if (ResStatus != null) {
          controller.GetUserinfo();
          Get.off(() => HomePage());
        } else {
          Get.off(Onboarding());
        }
      } else {
        Get.snackbar("Error", "Please Check Your Internet");
      }
    });

    update();
  }
}
