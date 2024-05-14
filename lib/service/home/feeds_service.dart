import 'package:dio/dio.dart';
import 'package:sahtech/model/feed.dart';

import '../../model/comment.dart';
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
        List<dynamic> responseData = response.data;
        List<Feed> feeds =
            responseData.map((json) => Feed.fromJson(json)).toList();

        return feeds;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }

  // get comment
  Future<List<Commenter>> getcomment(int pubId) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/get-all-comments';

    try {
      final response = await dio.get(url, queryParameters: {'postId': pubId});
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<Commenter> feeds =
            responseData.map((json) => Commenter.fromJson(json)).toList();

        return feeds;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }
}
