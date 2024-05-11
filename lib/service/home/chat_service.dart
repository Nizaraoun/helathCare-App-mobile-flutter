import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/chat.dart';
import 'package:sahtech/model/message.dart';

import '../../controller/home/home_page/chat_controller.dart';
import '../../utils/global/userdata.dart';

class ChatService {
  final Dio dio = Dio();
  String? token;
  ChatController chatController = Get.put(ChatController());
  Future<List<Chat>> getChatList() async {
    token = await UserData.getToken();
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

  // add a new message
  Future<void> addMessage(String message, String docId) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/Send_Message';
    try {
      final response =
          await dio.post(url, data: {'message': message, 'doctorId': docId});
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }

  //Get  messages by doctor id
  Future<List<Message>> getMessages(userid, doctorId) async {
    token = await UserData.getToken();
    dio.options.headers['Authorization'] = 'Bearer $token';
    const String url = 'http://10.0.2.2:8080/api/Get_Message';
    try {
      final response =
          await dio.get(url, data: {'doctorId': doctorId, 'userId': userid});
      if (response.statusCode == 200) {
        String responseData = response.data;
        List<Message> messages = parseMessages(responseData);
        for (var message in messages) {
          if (message.sender == userid) {
            chatController.messages
                .add(Message(sender: 'sender', body: message.body));
          } else {
            chatController.messages
                .add(Message(sender: 'receiver', body: message.body));
          }
        }

        return messages;
      } else {
        throw Exception('Failed to get reserved hours for doctor on day');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to get reserved hours for doctor on day: $e');
    }
  }

  List<Message> parseMessages(String data) {
    List<Message> messages = [];
    try {
      // Split data by new line character
      List<String> lines = data.split('\n');
      // Iterate through each line
      for (var line in lines) {
        // Extract sender ID and message body
        RegExp regExp = RegExp(r"(.+?)\s+:(.+)");
        Match? match = regExp.firstMatch(line);
        if (match != null) {
          String sender = match.group(1)!;
          String body = match.group(2)!;
          // Create Message object and add to list
          messages.add(Message(sender: sender.trim(), body: body.trim()));
        }
      }
    } catch (e) {
      print(e);
    }
    return messages;
  }
}
