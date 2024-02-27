import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../utils/global/snackError.dart';
import '../../view/authentification/login/login.dart';

Future<void> saveimage(String imagebase64, String uid) async {
  final dio = Dio();
  const String url = 'http://10.0.2.2:8080/saveimage';

  try {
    final response = await dio.post(
      url,
      data: {
        "image": imagebase64,
      },
      options: Options(
        headers: {
          "uid": uid,
        },
      ),
    );
    if (response.statusCode == 201) {
      Get.off(LoginScreen());
    } else {
      print('*****************bad**************************');
      showSnackError("خطأ", "البريد الالكتروني مستخدم مسبقا");
    }
  } catch (e) {
    print(e);
    showSnackError("خطأ", "البريد الالكتروني مستخدم مسبقا");
  }
}
