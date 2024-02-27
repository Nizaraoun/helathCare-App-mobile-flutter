import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/home/home%20page/home.dart';

import '../../controller/authentification/auth_controller.dart';
import '../../utils/global/snackError.dart';

Future<void> loginservice(String email, password) async {
  AthControllerImp controller = Get.put(AthControllerImp());
  final dio = Dio();
  const String url = 'http://10.0.2.2:8080/authenticate';
  print(email);
  print(password);

  try {
    final response = await dio.post(
      url,
      data: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      // save the token in the local storage
      controller.savetoken(response.data['accessToken']);
      Get.off(HomePage());
    } else {
      print(response.statusCode);
      showSnackError(
          "خطأ", "الرجاء التأكد من البريد الالكتروني أو كلمة المرور");
    }
  } catch (e) {
    print(e);
    showSnackError("خطأ", "الرجاء التأكد من البريد الالكتروني أو كلمة المرور");
  }
}
