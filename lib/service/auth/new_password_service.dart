import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahtech/utils/app_routes.dart';
import '../../utils/global/snack_error.dart';
import '../../utils/global/userdata.dart';

Future<void> newPassword(String password, String phone) async {
  final dio = Dio();
  const String url = 'http://10.0.2.2:8080/update-password';

  try {
    final response = await dio.post(
      url,
      data: {"password": password, "phone": phone},
    );
    if (response.statusCode == 200) {
      String? token = await UserData.getuserdata("token");
      if (token != null) {
        Get.back();
      } else {

        AppRoutes().goToEnd(AppRoutes.login);
      }
    } else {
      showSnackError("خطأ", "الرجاء التأكد من الرمز");
    }
  } catch (e) {
    showSnackError("خطأ", "الانترنت غير متاح حاليا");
  }
}
