import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahtech/controller/home/feed/feed_controller.dart';
import 'package:sahtech/model/feed.dart';

import '../../utils/global/userdata.dart';

class FeedsService {
  final Dio dio = Dio();
  String? token;
  Future<List<Feed>> getAllPub(String role) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/get-all-posts';

    try {
      final response = await dio.get(url, queryParameters: {'role': role});
      if (response.statusCode == 200) {
        print('response.data: ${response.data}');
        List<dynamic> responseData = response.data;
        // Map the response data to a list of DoctorDto objects

        List<Feed> feeds =
            responseData.map((json) => Feed.fromJson(json)).toList();

        print('feeds: $feeds');
        return feeds;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }
}
