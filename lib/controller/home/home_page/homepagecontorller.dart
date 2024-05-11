import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/doctor.dart';
import '../../../service/home/loading_doctor_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/global/snack_error.dart';
import '../../../utils/global/userdata.dart';

abstract class HomePageController extends GetxController {
  Future<List<DoctorDto>> topfFiveDoctor();
  recommendedDoctor();
  RxString userName = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    // Call topFiveDoctor() when the controller is initialized
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName.value = sharedPreferences.getString("nom")!;

    topfFiveDoctor();
  }

  RxList<DoctorDto> doctorDto = <DoctorDto>[].obs;
  Rxn<Image> image = Rxn<Image>();
  List<Rxn<Image>> imageList = [];
  String? token;
  late RxBool isLoading = true.obs;
}

class HomePageControllerimp extends HomePageController {
  // get top five doctor
  @override
  Future<List<DoctorDto>> topfFiveDoctor() async {
    try {
      // Get the token from the shared preferences
      token = await UserData.getToken();
      List<DoctorDto> doctors = await fetchtopfFiveDoctor(token!);
      // Store the list of doctors in the controller
      doctorDto.assignAll(doctors);
      // Return the list of doctors
      isLoading(false);
      update();
      return doctors;
    } catch (e) {
      return showSnackError("خطأ", "خطأ في الاتصال بالانترنت");
    }
  }

//get all recommended doctor
  @override
  recommendedDoctor() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString("token");
      return fetchtopfFiveDoctor(token!);
    } catch (e) {
      return showSnackError("خطأ", "خطأ في الاتصال بالانترنت");
    }
  }
}
