import 'package:dio/dio.dart';

import '../../utils/global/snack_error.dart';

Future<void> saveimage(String? imagebase64, String uid) async {
  final dio = Dio();
  dio.options.headers['Authorization'] = 'Bearer $uid';

  const String url = 'http://10.0.2.2:8080/api/addProfileimg';

  try { 
    final response = await dio.post(
      url,
      data: {
        "image": imagebase64,
      },
    );
    if (response.statusCode == 200) {
      showSnackError("تم", "تم حفظ الصورة بنجاح");
    } else {
      showSnackError("خطأ", "..........حدث خطأ ما اثناء حفظ الصورة");
    }
  } catch (e) {
    showSnackError("خطأ", " حدث خطأ ما اثناء حفظ الصورة");
  }
}
