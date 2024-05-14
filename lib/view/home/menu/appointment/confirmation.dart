import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/controller/home/doctor/reservation_controller.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/customtext.dart';

import 'widget/booking_detail.dart';

class ConfirmationAppointment extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String date;
  final String time;

  const ConfirmationAppointment({
    super.key,
    required this.doctorName,
    required this.speciality, required this.date, required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white1,
        appBar: AppBar(
            backgroundColor: ColorManager.white1,
            centerTitle: true,
            title: CustomTextWidget(
              Txt: 'تأكيد الموعد',
              color: ColorManager.black,
              size: 20,
              fontweight: FontWeight.bold,
              spacing: 0,
            )),
        body: Column(
          children: [
            Image.asset(
              'assets/images/Confirmation.png',
              height: Get.height / 3,
              width: Get.width,
            ),
            BookingDetails(
              doctorName: doctorName,
              date: date,
              speciality: speciality,
              time: time,
                  
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  txt: 'الرجوع',
                  color: ColorManager.transparent,
                  heightsize: Get.height / 18,
                  widthsize: Get.width / 2.5,
                  txtcolor: ColorManager.black,
                  bordercolor: ColorManager.grayColor,
                  weight: FontWeight.w500,
                  size: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomElevatedButton(
                  txt: 'تأكيد ',
                  color: ColorManager.primaryColor,
                  heightsize: Get.height / 18,
                  widthsize: Get.width / 2.4,
                  txtcolor: ColorManager.white1,
                  size: 20,
                  onPressed: () {
                    AppRoutes().goTo(AppRoutes.home);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
