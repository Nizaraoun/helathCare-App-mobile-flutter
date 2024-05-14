

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/feed.dart';
import 'package:sahtech/service/home/feeds_service.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/Appointment.dart';
import '../../../model/comment.dart';
import '../../../service/home/appointment_service.dart';

abstract class FeedController extends GetxController {
  RxList<Feed> doctorpub = <Feed>[].obs;
  RxList<Commenter> commentpub = <Commenter>[].obs;
  final TextEditingController _textEditingController = TextEditingController();
  Rxn<Image> image = Rxn<Image>();
  List<Rxn<Image>> imageList = [];
  RxBool isFeedScreen = true.obs;

  RxBool isloading = true.obs;
  RxDouble width = 0.0.obs;
  RxDouble height = 0.0.obs;
  RxString username = ''.obs;
  RxString userimage = ''.obs;
  Color color = ColorManager.grey;

  Future<List<Feed>> getAllPub(String role);
  // function
  Future<List<Commenter>> getcomment(int pubId);
  openaddfeed();
  like();

  @override
  void onInit() {
    
      getAllPub('user');
  
    super.onInit();
  }
}

class FeedControllerImp extends FeedController {
  @override
  Future<List<Feed>> getAllPub(String role) async {
    try {
      List<Feed> pub = await FeedsService().getAllPub(role);

      doctorpub.assignAll(pub);

      isloading(false);
      update();
      return doctorpub;
    } catch (e) {
      print("---------------------------------------");
    }
    update();
    return doctorpub;
  }

// get comment
  @override
 Future<List<Commenter>>getcomment(int pubId) async {
    try {
            List<Commenter> commentList = await FeedsService().getcomment(pubId);
            commentpub.assignAll(commentList);
            update();

    } catch (e) {
      print(e);
    }
    return commentpub;

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
  like() {
    color = Colors.red;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
