import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sahtech/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileController extends GetxController {
  RxList<User> profile = <User>[].obs;
  void getuserdetail();
  @override
  void onInit() async {
    getuserdetail();
    super.onInit();
  }
}

class ProfileControllerImp extends ProfileController {
  @override
  void getuserdetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    profile.add(User(
      id: prefs.getString('id')!,
      username: prefs.getString('nom')!,
      email: prefs.getString('mail')!,
      phone: prefs.getString('phone')!,
      cin: prefs.getString('cin')!,
    ));
  }
}
