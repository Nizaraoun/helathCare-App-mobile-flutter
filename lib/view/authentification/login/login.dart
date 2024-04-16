import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/authentification/signup/signup.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

import '../../../controller/authentification/auth_controller.dart';
import '../../../utils/global/validtion_input.dart';
import '../../../widgets/dvider.dart';
import '../../../widgets/cusomelvatedbutton.dart';
import '../../../widgets/custom_inkwell_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/customtext.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AthControllerImp controller = Get.put(AthControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            Txt: 'تسجيل الدخول',
            color: ColorManager.black,
            size: Get.width * 0.06,
            fontweight: FontWeight.bold,
            spacing: 0,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: Get.width * 0.03,
              right: Get.width * 0.03,
              top: Get.height * 0.04),
          child: Form(
            key: controller.formstatelogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // email
                CustomTextFormField(
                  inputType: TextInputType.text,
                  icon: const Icon(Icons.email),
                  texthint: "البريد الالكتروني",
                  validator: (p0) {
                    controller.inputlogin[0] = p0!;
                    return validInput(p0, "email");
                  },
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),
                // password
                CustomTextFormField(
                  inputType: TextInputType.text,
                  icon: const Icon(Icons.lock),
                  texthint: "كلمة المرور",
                  validator: (p0) {
                    controller.inputlogin[1] = p0!;
                    return validInput(p0, "IsPassword");
                  },
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),
                CustomInkWellWidget(
                  ontap: () {
                    AppRoutes().goTo(AppRoutes.forgetPassword);
                  },
                  widget: CustomTextWidget(
                    Txt: 'نسيت كلمة المرور؟',
                    color: ColorManager.primaryColor,
                    size: Get.width * 0.05,
                    fontweight: FontWeight.w500,
                    spacing: 0,
                  ),
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),

                // login button
                Center(
                  child: CustomElevatedButton(
                    size: Get.width * 0.05,
                    widthsize: Get.width * 0.8,
                    heightsize: Get.height * 0.07,
                    onPressed: () {
                      controller.login();
                    },
                    txt: 'تسجيل الدخول',
                  ),
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInkWellWidget(
                        ontap: () {
                          Get.off(const SignUpScreen());
                        },
                        widget: CustomTextWidget(
                          Txt: 'انشاء حساب',
                          color: ColorManager.primaryColor,
                          size: Get.width * 0.05,
                          fontweight: FontWeight.w500,
                          spacing: 0,
                        )),
                    Gap(Get.width * 0.02),
                    Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: Get.width * 0.05,
                      ),
                    ),
                  ],
                ),
                Gap(Get.width * 0.06),

                Row(
                  children: [
                    const DividerWidget(),
                    Text(
                      'او',
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: Get.width * 0.05,
                      ),
                    ),
                    const DividerWidget(),
                  ],
                ),
                Gap(Get.width * 0.06),
                // google button
                Center(
                  child: CustomElevatedButton(
                    size: Get.width * 0.05,
                    widthsize: Get.width * 0.8,
                    heightsize: Get.height * 0.07,
                    weight: FontWeight.normal,
                    txtcolor: ColorManager.black,
                    bordercolor: ColorManager.black,
                    onPressed: () {},
                    txt: 'تسجيل الدخول بحساب جوجل',
                    color: ColorManager.white,
                  ),
                ),
                Gap(Get.width * 0.06),
                // facebook button
                Center(
                  child: CustomElevatedButton(
                    size: Get.width * 0.05,
                    widthsize: Get.width * 0.8,
                    heightsize: Get.height * 0.07,
                    weight: FontWeight.normal,
                    bordercolor: ColorManager.black,
                    txtcolor: ColorManager.black,
                    onPressed: () {},
                    txt: 'تسجيل الدخول بحساب فيسبوك',
                    color: ColorManager.white,
                  ),
                ),
                Gap(Get.width * 0.06),
              ],
            ),
          ),
        ));
  }
}
