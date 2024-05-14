import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/chat.dart';
import 'package:sahtech/model/doctor.dart';
import 'package:sahtech/utils/global/userdata.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/message.dart';
import '../../../service/home/chat_service.dart';
import '../../../utils/global/snack_error.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;

class ChatController extends GetxController {
  late StreamSubscription<ably.Message> _subscription;

  RxList messages = [].obs;
  RxList<DoctorDto> doctorList = <DoctorDto>[].obs;
  late RxBool isLoading = true.obs;
  RxList<Chat> chatList = <Chat>[].obs;
  TextEditingController sendingTextController = TextEditingController();
  TextEditingController receivingTextController = TextEditingController();
  Color sendingBackgroundColor = ColorManager.primaryColor;
  Color receivingBackgroundColor = ColorManager.lightGrey2;
  Color sendingTextColor = ColorManager.white;
  Color receivingTextColor = ColorManager.black;
  ably.Realtime? realtimeClient;
  ably.Realtime? chatChannel;
  late Timer timer;

// Connect to Ably
  void createAblyRealtimeInstance() async {
// Create an instance of ClientOptions with Ably key
    final clientOptions = ably.ClientOptions(
        key: 'ebibFg.N46V3Q:CVggB4lLZTGuFHd4qWEFXI8nI-xfPuqzPoPrFrp3w_c');

// Use ClientOptions to create Realtime instance
    realtimeClient = ably.Realtime(options: clientOptions);
  }

  //send message
  void sendMessage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');

    if (sendingTextController.text.isNotEmpty) {
      messages.add(Message(sender: 'sender', body: sendingTextController.text));
      ChatService().addMessage(sendingTextController.text, doctorList[0].id!);
      {
        final channel = realtimeClient!.channels.get('chat_channel');
//publish the message
        await channel.publish(
          data: sendingTextController.text,
          name: id,
        );
      }

      sendingTextController.clear();
    }
  }

  //receive message
  void receiveMessage() async {
    if (receivingTextController.text.isNotEmpty) {
      final channel = realtimeClient!.channels.get('chat_channel');

//publish the message
      await channel.publish(
          data: receivingTextController.text, name: doctorList[0].id!);
      receivingTextController.clear();
    }
  }

  @override
  void onInit() {
    super.onInit();
    
    subscribeToMessageUpdates();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      subscribeToMessageUpdates();
    });
  }

  @override
  void onClose() {
    timer.cancel();
    sendingTextController.dispose();
    receivingTextController.dispose();
    _subscription.cancel(); // Cancel subscription
    super.onClose();
  }

  void subscribeToMessageUpdates() async {
    if (realtimeClient != null) {
      final channel = realtimeClient!.channels.get('chat_channel');
      _subscription = channel
          .subscribe(name: doctorList[0].id!)
          .listen((ably.Message message) async {
        messages.removeWhere((m) => m.body == message.data.toString());

        messages
            .add(Message(sender: 'receiver', body: message.data.toString()));
      });
    } else {
      createAblyRealtimeInstance();
    }
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

  Future<List<Message>> getMessagesById(String doctorId) async {
    // Future<String?> userid = UserData.getuserdata('id');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');

    try {
      List<Message> chat = await ChatService().getMessages(id, doctorId);

      return chat;
    } catch (e) {
      return [];
    }
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
