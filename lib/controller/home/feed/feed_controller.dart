import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/feed.dart';
import 'package:sahtech/service/home/feeds_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/Appointment.dart';
import '../../../service/home/appointment_service.dart';

abstract class FeedController extends GetxController {
  RxList<Feed> doctorpub = <Feed>[].obs;
  final TextEditingController _textEditingController = TextEditingController();
  RxDouble width = 0.0.obs;
  RxDouble height = 0.0.obs;
  RxString username = ''.obs;
  RxString userimage = ''.obs;

  getAllPub(String role);
  openaddfeed();

  @override
  void onInit() {
    getAllPub('user');
    super.onInit();
  }
}

class FeedControllerImp extends FeedController {
  @override
  getAllPub(String role) {
    FeedsService().getAllPub(role).then((value) {
      doctorpub.assignAll(value);
    });
  }

  @override
  openaddfeed() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // username.value = prefs.getString('nom')!;
    // userimage.value = prefs.getString('userimage')!;
    height.value = Get.height / 2;
    width.value = Get.width;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
