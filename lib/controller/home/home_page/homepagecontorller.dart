import 'package:get/get.dart';
import 'package:sahtech/model/doctor.dart';
import '../../../service/home/loading_doctor_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/global/snackError.dart';
import '../../../utils/global/token.dart';

abstract class HomePageController extends GetxController {
  Future<List<DoctorDto>> topfFiveDoctor();
  recommendedDoctor();

  @override
  void onInit() {
    super.onInit();
    // Call topFiveDoctor() when the controller is initialized
    topfFiveDoctor();
  }

  RxList<DoctorDto> doctorDto = <DoctorDto>[].obs;
  String? token;
  late RxBool isLoading = true.obs;
}

class HomePageControllerimp extends HomePageController {
  // get top five doctor
  @override
  Future<List<DoctorDto>> topfFiveDoctor() async {
    try {
      // Get the token from the shared preferences
      token = await Token.getToken();
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
