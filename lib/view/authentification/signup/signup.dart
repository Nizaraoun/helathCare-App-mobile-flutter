import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/authentification/login/login.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

import '../../../controller/authentification/auth_controller.dart';
import '../../../utils/global/validtion_input.dart';
import '../../../widgets/dvider.dart';
import '../../../widgets/cusomelvatedbutton.dart';
import '../../../widgets/custom_inkwell_widget.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/customtext.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AthControllerImp controller = Get.put(AthControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            Txt: 'تسجيل حساب جديد',
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
            key: controller.formstatesingup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                  inputType: TextInputType.name,
                  icon: const Icon(Icons.person_outline),
                  texthint: " الاسم الكامل ",
                  validator: (p0) {
                    controller.inputsignup[0] = p0!;

                    return validInput(p0, "username");
                  },
                ),
                // email
                CustomTextFormField(
                  inputType: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_outlined),
                  texthint: "البريد الالكتروني",
                  validator: (p0) {
                    controller.inputsignup[1] = p0!;

                    return validInput(p0, "email");
                  },
                ),
                CustomTextFormField(
                  inputType: TextInputType.phone,
                  icon: const Icon(
                    Icons.insert_drive_file_rounded,
                  ),
                  texthint: " رقم الهوية",
                  validator: (p0) {
                    controller.inputsignup[2] = p0!;

                    return validInput(p0, "NumericOnly");
                  },
                ),
                CustomTextFormField(
                  inputType: TextInputType.phone,
                  icon: const Icon(Icons.phone),
                  texthint: "رقم الهاتف",
                  validator: (p0) {
                    controller.inputsignup[3] = p0!;

                    return validInput(p0, "phone");
                  },
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),
                // password
                CustomTextFormField(
                  inputType: TextInputType.visiblePassword,
                  icon: const Icon(Icons.lock),
                  texthint: "كلمة المرور",
                  validator: (p0) {
                    controller.inputsignup[4] = p0!;

                    return validInput(p0, "IsPassword");
                  },
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
                      controller.signUp();
                    },
                    txt: 'انشاء حساب',
                  ),
                ),
                //use to add space between widgets
                Gap(Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomInkWellWidget(
                        ontap: () {
                          Get.off(LoginScreen());
                        },
                        widget: CustomTextWidget(
                          Txt: ' تسجيل الدخول',
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
