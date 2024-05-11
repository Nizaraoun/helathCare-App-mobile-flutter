import 'package:dio/dio.dart';

import '../../model/reservation.dart';
import '../../utils/global/userdata.dart';

class ReservationService {
  final Dio _dio = Dio();
  String? token;

  Future<ReservedHoursResponse> getReservedHoursForDoctorOnDay({
    required String idPraticien,
    required String jour,
  }) async {
    // Get the token from the shared preferences
    token = await UserData.getToken();
    _dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/getDoctorResrvation';

    try {
      final response = await _dio.get(url, queryParameters: {
        'id_praticien': idPraticien,
        'jour': jour,
      });
      if (response.statusCode == 200) {
        return ReservedHoursResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }
}
