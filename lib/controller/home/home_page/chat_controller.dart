import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/chat.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

import '../../../model/message.dart';
import '../../../service/home/chat_service.dart';
import '../../../utils/global/snack_error.dart';

class ChatController extends GetxController {
  RxList messages = [].obs;
  String? doctorname;
  late RxBool isLoading = true.obs;
  RxList<Chat> chatList = <Chat>[].obs;

  TextEditingController sendingTextController = TextEditingController();
  TextEditingController receivingTextController = TextEditingController();

  Color sendingBackgroundColor = ColorManager.primaryColor;
  Color receivingBackgroundColor = ColorManager.lightGrey2;

  Color sendingTextColor = ColorManager.white;
  Color receivingTextColor = ColorManager.black;

  void sendMessage() {
    if (sendingTextController.text.isNotEmpty) {
      messages.add(Message(sender: 'sender', body: sendingTextController.text));
      sendingTextController.clear();
    }
  }

  void receiveMessage() {
    if (receivingTextController.text.isNotEmpty) {
      messages
          .add(Message(sender: 'receiver', body: receivingTextController.text));
      receivingTextController.clear();
    }
  }

  @override
  void onInit() async {
    getChatList();
    super.onInit();
  }

  Future<List<Chat>> getChatList() async {
    isLoading(true);
    try {
      List<Chat> chat = await ChatService().getChatList();
      chatList.assignAll(chat);
      isLoading(false);
      update();
      return chat;
    } catch (e) {
      return showSnackError("خطأ", "خطأ في الاتصال بالانترنت");
    }
  }

  @override
  void onClose() {
    sendingTextController.dispose();
    receivingTextController.dispose();
    super.onClose();
  }

  static String extractMessage(String fullMessage) {
    // Assuming the id is separated from the message by a space
    int spaceIndex = fullMessage.indexOf(':');
    if (spaceIndex != -1) {
      return fullMessage.substring(spaceIndex + 1);
    }
    return fullMessage;
  }
}
