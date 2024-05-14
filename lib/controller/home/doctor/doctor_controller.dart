import 'package:get/get.dart';
import 'package:sahtech/service/home/get_doctor_by_specialty.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/doctor.dart';
import '../../../utils/global/snack_error.dart';
import '../../../utils/global/userdata.dart';

abstract class DoctorController extends GetxController {
  Future<List<DoctorDto>> getDoctorBySpecialty( String speciality);
  String? token;
    RxList<DoctorDto> doctorDto = <DoctorDto>[].obs;
  late RxBool isLoading = true.obs;

}

class DoctorControllerimp extends DoctorController {
  @override
  Future<List<DoctorDto>> getDoctorBySpecialty(String speciality) async {
      try {
      // Get the token from the shared preferences
      token = (await UserData.getToken());
      List<DoctorDto> doctors = await fetchBySpecialty(token! ,speciality);
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
  
}