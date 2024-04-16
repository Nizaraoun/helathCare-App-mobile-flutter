import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../controller/authentification/auth_controller.dart';
import '../../utils/global/snack_error.dart';
import '../../view/authentification/login/login.dart';

// ignore: non_constant_identifier_names
Future<void> Singinapi(String username, email, cin, phone, password) async {
  final dio = Dio();
  AthControllerImp controller = Get.put(AthControllerImp());
  const String url = 'http://10.0.2.2:8080/register';

  try {
    final response = await dio.post(
      url,
      data: {
        "username": email,
        "email": username,
        "cin": cin,
        "phone": phone,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      // await controller.saveuserdata(username, phone, email, cin);

      Get.off(LoginScreen());
    } else {
      showSnackError("خطأ", "البريد الالكتروني مستخدم مسبقا");
    }
  } catch (e) {
    showSnackError("خطأ", "البريد الالكتروني مستخدم مسبقا");
  }
}
