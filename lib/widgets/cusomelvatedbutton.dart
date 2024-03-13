import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../view/resources/color/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color txtcolor;
  final double size;
  final double widthsize;
  final double heightsize;
  final String txt;
  final FontWeight weight;
  final Color bordercolor;
  final Color color;
  final void Function()? onPressed;
  const CustomElevatedButton({
    super.key,
    required this.txt,
    this.bordercolor = ColorManager.primaryColor,
    this.color = ColorManager.primaryColor,
    this.txtcolor = ColorManager.white,
    this.onPressed,
    this.weight = FontWeight.bold,
    required this.size,
    required this.widthsize,
    required this.heightsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(widthsize, heightsize),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: bordercolor),
        ),
      ),
      child: CustomTextWidget(
        Txt: txt,
        color: txtcolor,
        size: size,
        fontweight: weight,
        spacing: 0,
      ),
    );
  }
}
