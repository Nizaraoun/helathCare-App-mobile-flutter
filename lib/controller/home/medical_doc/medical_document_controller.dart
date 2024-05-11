import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/document.dart';

import '../../../service/home/medical_doc_service.dart';
import '../../../utils/global/userdata.dart';

abstract class MedicalDocument extends GetxController {
  RxList<Document> documentDto = <Document>[].obs;
  String? token;
  RxString selectedDoc = ''.obs;
  late RxBool isLoading = true.obs;
  Future<List<Document>> getdocument();
  adddocument();
  deleteDocument(String id);
  @override
  void onInit() {
    getdocument();
    super.onInit();
  }
}

class MedicalDocumentimp extends MedicalDocument {
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
}
