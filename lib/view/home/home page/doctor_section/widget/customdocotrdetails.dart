import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../../widgets/customtext.dart';
import '../../../../resources/color/color_manager.dart';
import '../../../../resources/size_config.dart';

class DoctorDetails extends StatelessWidget {
  final int index;
  final String doctorname;
  final double namesize;
  final FontWeight fontweightname;
  final double specialitytextsiz;
  final FontWeight specialityweight;
  final double spacing;
  final double sizerating;
  final FontWeight fontweightrating;
  final TextStyle fontsizerating;
  final double iconsizerating;

  final HomePageControllerimp controller;
  const DoctorDetails({
    super.key,
    required this.index,
    required this.controller,
    required this.doctorname,
    required this.namesize,
    required this.fontweightname,
    required this.specialitytextsiz,
    required this.specialityweight,
    required this.spacing,
    required this.sizerating,
    required this.fontweightrating,
    required this.fontsizerating,
    required this.iconsizerating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          Txt: doctorname,
          size: namesize,
          color: ColorManager.blackLight,
          fontweight: fontweightname,
          spacing: 0,
        ),
        CustomTextWidget(
          Txt: controller.doctorDto[index].speciality ?? " ",
          size: specialitytextsiz,
          color: ColorManager.grey4,
          fontweight: specialityweight,
          spacing: 0,
        ),
        Gap(spacing),
        Container(
          width: SizeUtil().calculateTextWidth(
                controller.doctorDto[index].rate.toString() ?? " ",
                fontsizerating,
              ) +
              iconsizerating,
          decoration: BoxDecoration(
            color: ColorManager.greenrate,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: iconsizerating,
                color: ColorManager.primaryColor,
              ),
              CustomTextWidget(
                fontfamily: 'Cairo',
                Txt: controller.doctorDto[index].rate.toString(),
                size: sizerating,
                color: ColorManager.primaryColor,
                fontweight: fontweightrating,
                spacing: 0,
              ),
            ],
          ),
        ),
        Gap(spacing),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.place,
              color: ColorManager.grey4,
            ),
            CustomTextWidget(
              Txt: " 800 ",
              size: Get.width / 22,
              color: ColorManager.blackLight,
              fontweight: FontWeight.w300,
              spacing: 0,
            ),
          ],
        ),
        // Text(controller.doctorDto![index].name ?? " "),
        // Text(controller.doctorDto![index].speciality ??
        //     " "),
        // Text(controller.doctorDto![index].phone ?? " "),
      ],
    );
  }
}
