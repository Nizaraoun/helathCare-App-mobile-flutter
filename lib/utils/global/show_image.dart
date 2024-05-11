import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_page/homepagecontorller.dart';

class ShowImage {
  Rxn<Image> image = Rxn<Image>();
  HomePageControllerimp controller = Get.put(HomePageControllerimp());
  loadImage(String base64Image) async {
    Uint8List bytes = base64Decode(base64Image);
    image.value = Image.memory(bytes);
    controller.image.value = image.value;
  }
}
