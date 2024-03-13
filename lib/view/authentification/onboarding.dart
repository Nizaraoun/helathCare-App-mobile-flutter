import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/authentification/signup/signup.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../widgets/cusomelvatedbutton.dart';
import '../resources/color/color_manager.dart';
import 'login/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/logo.png'),
              alignment: Alignment.center,
              color: ColorManager.primaryColor,
              width: Get.width * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  Txt: "Sah",
                  color: ColorManager.primaryColor,
                  size: Get.width * 0.08,
                  fontweight: FontWeight.bold,
                  spacing: 2,
                ),
                CustomTextWidget(
                  Txt: "Tech",
                  color: ColorManager.red,
                  size: Get.width * 0.08,
                  fontweight: FontWeight.bold,
                  spacing: 2,
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            CustomTextWidget(
              Txt: "مرحبا بكم في تطبيق صحتك",
              color: ColorManager.black,
              size: Get.width * 0.06,
              fontweight: FontWeight.bold,
              spacing: 0,
            ),
            CustomTextWidget(
              Txt: "تطبيق صحتك يساعدك في العناية بصحتك",
              color: ColorManager.black,
              size: Get.width * 0.05,
              fontweight: FontWeight.w500,
              spacing: 0,
            ),
            SizedBox(height: Get.height * 0.09),
            CustomElevatedButton(
              size: Get.width * 0.05,
              widthsize: Get.width * 0.8,
              heightsize: Get.height * 0.07,
              txt: "تسجيل الدخول",
              color: ColorManager.primaryColor,
              onPressed: () {
                Get.off(LoginScreen());
              },
            ),
            SizedBox(height: Get.height * 0.02),
            CustomElevatedButton(
              size: Get.width * 0.05,
              widthsize: Get.width * 0.8,
              heightsize: Get.height * 0.07,
              txt: "أنشاء حساب جديد",
              color: ColorManager.red,
              onPressed: () {
                Get.off(SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
