import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/global/userdata.dart';
import 'package:sahtech/view/authentification/forgetpassword/send_otp_screen.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/auth/login_service.dart';
import '../../service/auth/opt_service.dart';
import '../../service/auth/signup_service.dart';

abstract class Authcontroller extends GetxController {
  // void singinwidget();
  // void singupwidget();
  // void back();
  login();
  signUp();
}

class AthControllerImp extends Authcontroller {
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  GlobalKey<FormState> formstatesingup = GlobalKey<FormState>();
  GlobalKey<FormState> formstateotp = GlobalKey<FormState>();
  List<String> inputsignup = ["", "", "", "", ""];
  List<String> inputlogin = ["", ""];
  List<String> inputotp = ["", "", "", "", "", ""];
  String? name;

  //SignUp

  @override
  login() async {
    var formdata = formstatelogin.currentState;
    if (formdata!.validate()) {
      loginservice(inputlogin[0], inputlogin[1]);
    }
    update();
  }

  @override
  signUp() async {
    var formdata = formstatesingup.currentState;

    if (formdata!.validate()) {
      Singinapi(inputsignup[0], inputsignup[1], inputsignup[2], inputsignup[3],
          inputsignup[4]);
    }

    update();
  }

// bch nkhou les donnée mta3 l'utilisateur
  String getuserinfo() {
    UserData.getuserdata("nom").then((value) {
      name = value;
      update();
    });
    return name!;
  }

  //save user data in shared preferences
  saveuserdata(String username, email, cin, phone, id, image) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("id", id);
    sharedPreferences.setString("nom", email);
    sharedPreferences.setString("mail", username);
    sharedPreferences.setString("phone", phone);
    sharedPreferences.setString("cin", cin);
    sharedPreferences.setString("saved_image", image);
    update();
  }

  //save jwt token in shared preferences
  savetoken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
    update();
  }

//logout
  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("nom");
    sharedPreferences.remove("mail");
    sharedPreferences.remove("phone");
    sharedPreferences.remove("cin");
    sharedPreferences.remove("token");
    Get.offAll(LoginScreen());
    update();
  }

  void forgetpassword() async {
    var formdata = formstateotp.currentState;
    if (formstatelogin.currentState!.validate()) {
      String otp = inputotp[0] +
          inputotp[1] +
          inputotp[2] +
          inputotp[3] +
          inputotp[4] +
          inputotp[5];
      otpService(otp);
    }
  }
}
