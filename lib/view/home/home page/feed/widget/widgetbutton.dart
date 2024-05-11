
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/customtext.dart';
class ButtonWidget extends StatelessWidget {
  final String txt;
  final IconData icon;
  final Color color2, color1;
  final Function() onpress;
  const ButtonWidget({
    super.key,
    required this.txt,
    required this.icon,
    required this.color2,
    required this.color1,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width / 2.6, Get.height / 16),
            backgroundColor: color1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onpress,
        icon: Icon(
          icon,
          color: color2,
        ),
        label: CustomTextWidget(
          Txt: txt,
          size: 20,
          fontweight: FontWeight.w400,
          color: color2,
          spacing: 0.0,
          fontfamily: 'Tajawal',
        ));
  }
}
