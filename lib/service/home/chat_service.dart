import 'package:dio/dio.dart';
import 'package:sahtech/model/chat.dart';

import '../../utils/global/token.dart';

class ChatService {
  final Dio dio = Dio();
  String? token;

  Future<List<Chat>> getChatList() async {
    token = await Token.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/Get_All_Message';

    try {
      final response = await dio.get(url, queryParameters: {'role': 'user'});
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        // Map the response data to a list of DoctorDto objects
        List<Chat> message =
            responseData.map((json) => Chat.fromJson(json)).toList();
        return message;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }
}
