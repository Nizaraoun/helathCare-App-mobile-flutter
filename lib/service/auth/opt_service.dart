import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';

import '../../controller/authentification/auth_controller.dart';
import '../../utils/global/snack_error.dart';

Future<void> otpService(String otp) async {
  final dio = Dio();
  AthControllerImp controller = Get.put(AthControllerImp());
  const String url = 'http://10.0.2.2:8080/otp/validate-otp';

  try {
    final response = await dio.post(
      url,
      data: {"username": controller.inputsignup[1], "otpNumber": otp},
    );
    if (response.statusCode == 200) {
      // save the token in the local storage

      AppRoutes().goToEnd(AppRoutes.login);
    } else {
      showSnackError("خطأ", "الرجاء التأكد من الرمز");
    }
  } catch (e) {
    showSnackError("خطأ", "الانترنت غير متاح حاليا");
  }
}
