import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/home/home%20page/home.dart';

import '../../controller/authentification/auth_controller.dart';
import '../../model/user.dart';
import '../../utils/global/snack_error.dart';

Future<void> loginservice(String email, password) async {
  AthControllerImp controller = Get.put(AthControllerImp());
  final dio = Dio();
  const String url = 'http://10.0.2.2:8080/authenticate';

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
      final responseData = response.data;
      final user = User.fromJson(responseData['user']);

      controller.saveuserdata(
          user.username, user.email, user.cin, user.phone, user.id, user.image);

      Get.off(const HomePage());
    } else {
      showSnackError(
          "خطأ", "الرجاء التأكد من البريد الالكتروني أو كلمة المرور");
    }
  } catch (e) {
    showSnackError("خطأ", "الرجاء التأكد من البريد الالكتروني أو كلمة المرور");
  }
}
