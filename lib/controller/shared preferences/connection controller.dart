import 'dart:async';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:sahtech/utils/global/check_internet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_routes.dart';
import '../global/user controller .dart';
import '../home/home_page/homepagecontorller.dart';

abstract class Internetcontroller extends GetxController {
  String? resStatus;
  var res = false;
  initiadata();
  UserController controller = Get.put(UserController());
  HomePageControllerimp controller2 = Get.put(HomePageControllerimp());
}

class Internetcontrollerimp extends Internetcontroller {
  @override
  initiadata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    resStatus = sharedPreferences.getString("token");
    res = await checkInternet();
    print("object");

    Timer(const Duration(seconds: 3), () async {
      if (res == true) {
        if (resStatus != null) {
          print("object");
          await controller.GetUserinfo();
          await controller.MyLocation();
          AppRoutes().goToEnd(AppRoutes.home);
          update();
        } else {
          AppRoutes().goToEnd(AppRoutes.onboarding);
          update();
        }
      } else {
        Get.snackbar("Error", "Please Check Your Internet");
      }
    });

    update();
  }
}
