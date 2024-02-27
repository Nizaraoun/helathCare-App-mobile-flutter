import 'package:get/get.dart';
import 'package:sahtech/splash_screen.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:sahtech/view/authentification/signup/signup.dart';

import '../view/home/home page/ambulance_section/ambulance_secreen.dart';
import '../view/home/home page/doctor_section/doctor_home_page.dart';
import '../view/home/home page/home.dart';
import '../view/home/home page/hospital_section/hospital_screen.dart';
import '../view/home/home page/lab_section/lab_section.dart';
import '../view/home/home page/pharmcy_section/pharmcy.dart';
import '../view/home/menu/medical_document.dart';

class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const doctor = '/doctor';
  static const hospital = '/hospital';
  static const pharmacy = '/pharmacy';
  static const lab = '/lab';
  static const ambulance = '/ambulance';
  static const medicalDoc = '/medicalDoc';

// List of services routing
  List<String> serviceRouting = [
    "/doctor",
    "/hospital",
    "/pharmacy",
    "/lab",
    "/ambulance",
  ];

  List<GetPage> appRoutes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => SignUpScreen()),
    GetPage(name: splash, page: () => const Splash()),
    GetPage(name: doctor, page: () => const DoctorScreen()),
    GetPage(name: hospital, page: () => const HospitalScreen()),
    GetPage(name: pharmacy, page: () => const PharmacyScreen()),
    GetPage(name: lab, page: () => const LabScreen()),
    GetPage(name: ambulance, page: () => const AmbulanceScreen()),
    GetPage(name: medicalDoc, page: () => MedicalDoc()),
  ];

// Routing method to navigate
  void goTo(String pagename) {
    Get.toNamed(pagename);
  }

// Routing method and remove all previous pages
  void goToEnd(String pagename) {
    Get.offAllNamed(pagename);
  }
}
