import 'dart:ffi';

import 'package:dio/dio.dart';

import '../../model/Appointment.dart';
import '../../utils/global/userdata.dart';

class AppointmentService {
  final Dio dio = Dio();
  String? token;

  Future<List<Appointments>> getAppointmentList(String id) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/getUpcomingReservations';
    try {
      final response = await dio.get(url, queryParameters: {
        'id': id,
      });
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<Appointments> appointment =
            responseData.map((json) => Appointments.fromJson(json)).toList();

        return appointment;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }

  Future<void> cancelAppointment(int id) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/CancelReservation';
    try {
      final response = await dio.post(url, queryParameters: {
        'id': id,
      });
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to cancel appointment');
      }
    } catch (e) {
      throw Exception('Failed to cancel appointment: $e');
    }
  }
}
