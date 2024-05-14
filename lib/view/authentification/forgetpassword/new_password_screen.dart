import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/custom_text_field.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../controller/authentification/auth_controller.dart';
import '../../../utils/global/validtion_input.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AthControllerImp controller = Get.put(AthControllerImp());

    return Scaffold(
      backgroundColor: ColorManager.white2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
          centerTitle: true,
          title: const CustomTextWidget(
            Txt: "تغيير كلمة المرور",
            size: 20,
            fontweight: FontWeight.bold,
            color: Colors.black,
            spacing: 0,
          )),
      body: Column(
        children: [
          Image.asset(
            'assets/images/newpassword.png',
            height: 200,
          ),
          Gap(Get.height * 0.03),
          CustomTextWidget(
            Txt: "قم بإدخال كلمة المرور الجديدة",
            size: 20,
            fontweight: FontWeight.w600,
            color: ColorManager.darkestBlue,
            spacing: 0,
          ),
          Gap(Get.height * 0.04),
          Form(
            key: controller.newpassword,
            child: Column(
              children: [
                CustomTextFormField(
                  obscureText: true,
                  texthint: "كلمة المرور الجديدة",
                  inputType: TextInputType.text,
                  validator: (p0) {
                    controller.inputnewpassword[0] = p0!;
                    return validInput(p0, "IsPassword");
                  },
                  icon: const Icon(FontAwesomeIcons.lock),
                ),
                Gap(Get.height * 0.01),
                CustomTextFormField(
                  obscureText: true,
                  texthint: "تأكيد كلمة المرور الجديدة",
                  inputType: TextInputType.text,
                  validator: (p0) {
                    controller.inputnewpassword[1] = p0!;
                    return validInput(p0, "IsPassword");
                  },
                  icon: const Icon(FontAwesomeIcons.lock),
                ),
                Gap(Get.height * 0.05),
                CustomElevatedButton(
                  bordercolor: ColorManager.primaryColor,
                  txt: "تأكيد",
                  onPressed: () {
                    controller.newPasswordFN();
                  },
                  size: Get.width / 20,
                  color: ColorManager.primaryColor,
                  txtcolor: ColorManager.white,
                  widthsize: Get.width / 1.2,
                  heightsize: Get.height / 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
