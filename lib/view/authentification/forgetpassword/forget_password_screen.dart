import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../widgets/custom_text_field.dart';
import '../../../widgets/searchfiled.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: CustomTextWidget(
            Txt: 'أستعادة كلمة المرور',
            color: Colors.black,
            fontweight: FontWeight.bold,
            size: Get.width * 0.05,
            spacing: 0,
            fontfamily: 'Cairo',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.only(
              top: Get.height * 0.05,
              left: Get.width * 0.05,
              right: Get.width * 0.05),
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/using-phone.png',
                  width: Get.width * 0.4, height: Get.height * 0.3),
              Gap(Get.height * 0.05),
              SerchField(
                inputType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'أدخل رقم الهاتف';
                  }
                  return null;
                },
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_android_outlined),
                ),
                texthint: 'أدخل رقم الهاتف',
              ),
              Gap(Get.height * 0.05),
              CustomElevatedButton(
                txt: 'أستعادة كلمة المرور',
                heightsize: Get.height * 0.07,
                widthsize: Get.width * 0.5,
                size: Get.width * 0.04,
                bordercolor: Colors.transparent,
                color: ColorManager.primaryColor,
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
