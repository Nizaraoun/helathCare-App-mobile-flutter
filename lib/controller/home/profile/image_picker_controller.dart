import 'dart:io';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../service/home/save_user_images_service.dart';
import '../../../utils/global/userdata.dart';

abstract class ImageController extends GetxController {
  selectImage();
  saveImage(String imagePath);
  saveBase64Image(String base64Image);
  loadImage();
  @override
  void onInit() {
    loadImage();
    super.onInit();
  }
}

class ImageControllerImp extends ImageController {
  Rxn<Image> image = Rxn<Image>();

  @override
  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      await saveImage(pickedImage.path);
      await loadImage();
    }
    update();
  }

//save image
  @override
  saveImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final bytes = await imageFile.readAsBytes();
    String? base64Image = base64Encode(bytes);
    //save image to local storage
    await saveBase64Image(base64Image);
    UserData.getToken().then((value) {
      saveimage(base64Image, value!);
    });
    // await saveimage(base64Image, "uid");
  }

//save image to local storage
  @override
  saveBase64Image(String base64Image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_image', base64Image);
  }

  @override
  loadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? base64Image = prefs.getString('saved_image');
    if (base64Image != null) {
      Uint8List bytes = base64Decode(base64Image);
      image.value = Image.memory(bytes);
    }
  }
}
