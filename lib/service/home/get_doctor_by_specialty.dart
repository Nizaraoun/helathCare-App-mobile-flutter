import 'package:dio/dio.dart';

import '../../model/doctor.dart';
import '../../utils/global/snack_error.dart';

Future<List<DoctorDto>> fetchBySpecialty(String token,  String  speciality) async {
  Dio dio = Dio();
  dio.options.headers['Authorization'] = 'Bearer $token';

  const String url = 'http://10.0.2.2:8080/api/get_doctor_By_Speciality';

  try {
    final response = await dio.get(url,queryParameters: {"speciality":speciality});
    if (response.statusCode == 200) {
      // Extract data from the response

      List<dynamic> responseData = response.data;
      // Map the response data to a list of DoctorDto objects
      List<DoctorDto> doctors =
          responseData.map((json) => DoctorDto.fromJson(json)).toList();
      return doctors;
    } else {}
  } catch (e) {
    showSnackError("عفوا", "حدث خطأ ما اثناء البحث عن الأطباء");
  }
  return [];
}