import 'package:get/get.dart';
import 'package:sahtech/splash_screen.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:sahtech/view/authentification/onboarding.dart';
import 'package:sahtech/view/authentification/signup/signup.dart';
import 'package:sahtech/view/home/doctor_screen/widget/jour_widget.dart';

import '../view/authentification/forgetpassword/forget_password_screen.dart';
import '../view/authentification/forgetpassword/send_otp_screen.dart';
import '../view/home/doctor_screen/home_doctor.dart';
import '../view/home/doctor_screen/rende_vous.dart';
import '../view/home/home page/ambulance_section/ambulance_secreen.dart';
import '../view/home/home page/doctor_section/all_top_doctor.dart';
import '../view/home/home page/doctor_section/doctor_home_page.dart';
import '../view/home/home page/home.dart';
import '../view/home/home page/hospital_section/hospital_screen.dart';
import '../view/home/home page/lab_section/lab_section.dart';
import '../view/home/home page/pharmcy_section/pharmcy.dart';
import '../view/home/menu/medical_document.dart';
import '../view/welcompage.dart';

class AppRoutes {
  static const home = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const forgetPassword = '/forgetPassword';
  static const sendOtp = '/sendOtp';
  static const doctor = '/doctor';
  static const hospital = '/hospital';
  static const pharmacy = '/pharmacy';
  static const lab = '/lab';
  static const ambulance = '/ambulance';
  static const medicalDoc = '/medicalDoc';
  static const onboarding = '/onboarding';
  static const welcomePage = '/welcomePage';
  static const topdoctor = '/doctorScreen';
  static const rendVous = '/jourwidget';
  static const doctorProfile = '/doctorProfile';

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
    GetPage(name: forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: sendOtp, page: () => SendOtp()),
    GetPage(name: splash, page: () => const Splash()),
    GetPage(name: doctor, page: () => const DoctorScreen()),
    GetPage(name: hospital, page: () => const HospitalScreen()),
    GetPage(name: pharmacy, page: () => const PharmacyScreen()),
    GetPage(name: lab, page: () => const LabScreen()),
    GetPage(name: ambulance, page: () => const AmbulanceScreen()),
    GetPage(name: medicalDoc, page: () => MedicalDoc()),
    GetPage(name: onboarding, page: () => const Onboarding()),
    GetPage(name: welcomePage, page: () => const WelcomePage()),
    GetPage(name: topdoctor, page: () => TopDoctor()),
    GetPage(name: doctorProfile, page: () => DoctorProfile()),
    GetPage(name: rendVous, page: () => RendVous()),
  ];

// Routing method to navigate
  void goTo(String pagename, {dynamic requiredVariable}) {
    Get.toNamed(pagename,
        arguments: requiredVariable); // Pass the required variable as arguments
  }

// Routing method and remove all previous pages
  void goToEnd(String pagename) {
    Get.offAllNamed(pagename);
  }

  void goTowithvarbiable(String pagename, dynamic requiredVariable) {
    Get.toNamed(pagename,
        arguments: requiredVariable); // Pass the required variable as arguments
  }
}
