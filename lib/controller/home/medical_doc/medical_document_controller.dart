import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sahtech/model/document.dart';

import '../../../service/home/medical_doc_service.dart';
import '../../../utils/global/snack_error.dart';
import '../../../utils/global/userdata.dart';

abstract class MedicalDocument extends GetxController {
  RxList<Document> documentDto = <Document>[].obs;
  String? token;
  RxString selectedDocId = ''.obs;
  RxString selectedDoc = ''.obs;
  late RxBool isLoading = true.obs;

  Future<List<Document>> getdocument();
  adddocument();
  deleteDocument(String id);
  selectImageFile();
  saveImage(String imagePath, selectedDoc);
  @override
  void onInit() {
    getdocument();
    super.onInit();
  }
}

class MedicalDocumentimp extends MedicalDocument {
  Rxn<Image> image = Rxn<Image>();

  GlobalKey<FormState> formdocument = GlobalKey<FormState>();
  String? docName;

  @override
  Future<List<Document>> getdocument() async {
    token = await UserData.getToken();

    try {
      List<Document> document =
          await DocumentService().fetchmedicaldocment(token!);
      // Store the list of doc in the controller
      documentDto.assignAll(document);
      // Return the list of doc
      isLoading(false);
      update();
      return document;
    } catch (e) {
      return [];
    }
  }

  @override
  adddocument() async {
    token = await UserData.getToken();
    var formdata = formdocument.currentState;
    if (formdata!.validate()) {
      DocumentService().addmedicaldocment(token!, docName!);
      await getdocument();
    }
    update();
  }

  @override
  deleteDocument(String id) async {
    token = await UserData.getToken();
    DocumentService().deleteDocument(id, token!);
    getdocument();
    update();
  }

  @override
  selectImageFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (selectedDocId.value != '') {
        saveImage(pickedImage.path, selectedDocId.value);
      } else {
        showSnackError("خطأ", "الرجاء اختيار ملف للتحميل");
      }
    }
  }

  @override
  saveImage(String imagePath, selectedDocId) async {
    final File imageFile = File(imagePath);
    final bytes = await imageFile.readAsBytes();
    String? base64Image = base64Encode(bytes);
    //save image to local storage
    UserData.getToken().then((value) async {
      await DocumentService().addFileToDocument(
        selectedDocId,
        value!,
        base64Image,
      );
    });
    // await saveimage(base64Image, "uid");
  }
  // @override
  // saveBase64Image(String base64Image) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('saved_image', base64Image);
  // }
}
