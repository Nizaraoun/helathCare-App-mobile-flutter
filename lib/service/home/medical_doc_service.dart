import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/document.dart';
import 'package:sahtech/utils/global/snack_error.dart';

class DocumentService {
  //add medical document
  Future<void> addmedicaldocment(String token, String docName) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/add-medical-doc';
    try {
      final response = await dio.post(
        url,
        data: {
          "description": docName,
        },
      );
      if (response.statusCode == 200) {
        Get.back();
      } else {
        showSnackError("خطأ", "لديك ملف طبي بنفس الاسم مسبقا");
      }
    } catch (e) {
      showSnackError("خطأ", " لديك ملف طبي بنفس الاسم مسبقا");
    }
  }

  // Fetch medical document
  Future<List<Document>> fetchmedicaldocment(String token) async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/get-medical-doc';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<Document> document =
            responseData.map((json) => Document.fromJson(json)).toList();
        return document;
      } else {
        showSnackError("عفوا", "حدث خطأ ما اثناء البحث عن الملفات الطبية");
      }
    } catch (e) {
      print(e);
      showSnackError("عفوا", "حدث خطأ ما اثناء البحث عن الملفات الطبية");
    }
    return [];
  }
}
