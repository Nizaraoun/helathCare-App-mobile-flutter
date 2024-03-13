import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:sahtech/view/home/home%20page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/auth/login_service.dart';
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
  getuserinfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString("nom");
    sharedPreferences.getString("phone");

    update();
  }

  //save user data in shared preferences
  saveuserdata(String username, email, cin, phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("nom", username);
    sharedPreferences.setString("mail", phone);
    sharedPreferences.setString("phone", email);
    sharedPreferences.setString("cin", cin);
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
    Get.offAll(LoginScreen());
    update();
  }

  void forgetpassword() async {
    var formdata = formstateotp.currentState;

    if (formstatelogin.currentState!.validate()) {}
  }
}
