import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

import '../../../controller/authentification/auth_controller.dart';
import '../../../utils/global/ValidtionInput.dart';
import '../../../widgets/cusomelvatedbutton.dart';
import '../../../widgets/custom_inkwell_widget.dart';
import '../../../widgets/customtext.dart';

class SendOtp extends StatelessWidget {
  SendOtp({super.key});
  AthControllerImp controller = Get.put(AthControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: CustomTextWidget(
          Txt: '  أدخل رمز التحقق',
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
            Image.asset('assets/images/sms.png',
                width: Get.width * 0.4, height: Get.height * 0.3),
            CustomTextWidget(
              Txt: '  تم إرسال رمز التحقق إلى رقم الهاتف',
              color: ColorManager.black,
              fontweight: FontWeight.w400,
              size: Get.width * 0.05,
              spacing: 0,
              fontfamily: 'Tajawal',
            ),
            Gap(Get.height * 0.02),
            Form(
              key: controller.formstateotp,
              child: Row(
                children: [
                  OtpField(
                    onchanged: (p0) {
                      controller.inputotp[0] = p0;
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    validator: (p0) {
                      return validInput(p0!, "isNumericOnly");
                    },
                  ),
                  OtpField(
                    onchanged: (p0) {
                      controller.inputotp[1] = p0;
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    validator: (p0) {
                      return validInput(p0!, "isNumericOnly");
                    },
                  ),
                  OtpField(
                    onchanged: (p0) {
                      controller.inputotp[2] = p0;
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    validator: (p0) {
                      return validInput(p0!, "isNumericOnly");
                    },
                  ),
                  OtpField(
                    onchanged: (p0) {
                      controller.inputotp[3] = p0;
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    validator: (p0) {
                      return validInput(p0!, "isNumericOnly");
                    },
                  ),
                  OtpField(
                    onchanged: (p0) {
                      controller.inputotp[4] = p0;
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    validator: (p0) {
                      return validInput(p0!, "isNumericOnly");
                    },
                  ),
                ],
              ),
            ),
            Gap(Get.height * 0.07),
            CustomElevatedButton(
              size: Get.width * 0.05,
              bordercolor: Colors.grey,
              color: ColorManager.primaryColor,
              txt: 'أستعادة كلمة المرور',
              heightsize: Get.height * 0.07,
              widthsize: Get.width * 0.5,
              onPressed: () {
                controller.forgetpassword();
              },
            ),
            Gap(Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInkWellWidget(
                  ontap: () {},
                  widget: CustomTextWidget(
                    Txt: 'أعادة إرسال',
                    color: ColorManager.primaryColor,
                    fontweight: FontWeight.w400,
                    size: Get.width * 0.04,
                    spacing: 0,
                    fontfamily: 'Tajawal',
                  ),
                ),
                CustomTextWidget(
                  Txt: '  لم تصلك رسالة؟',
                  color: ColorManager.black,
                  fontweight: FontWeight.w400,
                  size: Get.width * 0.04,
                  spacing: 0,
                  fontfamily: 'Tajawal',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  final String? Function(String?) validator;
  final Function(String) onchanged;

  const OtpField({
    super.key,
    required this.validator,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 190, 189, 189).withOpacity(0.2),
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              blurRadius: 9,
              offset: const Offset(2, 1), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          textAlign: TextAlign.right,
          keyboardType: TextInputType.number,
          maxLength: 1,
          strutStyle: const StrutStyle(height: 1.5),
          keyboardAppearance: Brightness.dark,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          focusNode: FocusNode(canRequestFocus: true),
          onChanged: onchanged,
          autofillHints: const [AutofillHints.telephoneNumber],
          cursorHeight: 40,
          cursorColor: ColorManager.primaryColor,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: validator,
          decoration: InputDecoration(
            iconColor: ColorManager.black,
            fillColor: ColorManager.white,
            filled: true,
            constraints: const BoxConstraints(maxHeight: 75),
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: ColorManager.primaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "****",
            hintStyle: TextStyle(
              color: ColorManager.grey,
              fontFamily: 'Tajawal',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
