import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../controller/authentification/auth_controller.dart';
import '../view/resources/color/color_manager.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final IconData icone;
  final Function()? onpressed;
  final Color color;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.icone,
    required this.color,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.white1,
      actionsAlignment: MainAxisAlignment.center,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      actions: [
        Column(
          children: [
            Gap(Get.height / 20),
            CustomIconButton(
              icon: Icon(icone),
              onPressed: () {},
              color: color,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ColorManager.lightGrey2,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              tooltip: "الاشعارات",
              iconSize: Get.width / 6.5,
              alignment: Alignment.centerLeft,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              autofocus: true,
            ),
            Gap(Get.height / 20),
            CustomTextWidget(
              Txt: title,
              size: 16,
              color: Colors.black,
              fontweight: FontWeight.w600,
              spacing: 0,
            ),
            Gap(Get.height / 20),
            CustomElevatedButton(
              onPressed: onpressed,
              txt: "تأكيد",
              txtcolor: Colors.black,
              color: ColorManager.primaryColor,
              size: 18,
              widthsize: Get.width / 2.5,
              heightsize: Get.height / 15,
            ),
            Gap(Get.height / 42),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              txt: "الغاء",
              txtcolor: Colors.black,
              color: ColorManager.lightGrey2,
              size: 18,
              widthsize: Get.width / 2.5,
              heightsize: Get.height / 15,
            ),
          ],
        )
      ],
    );
  }
}
