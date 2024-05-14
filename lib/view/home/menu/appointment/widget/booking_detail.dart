import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahtech/widgets/customtext.dart';
import 'package:sahtech/widgets/dvider.dart';

import '../../../../resources/color/color_manager.dart';

class BookingDetails extends StatelessWidget {
  final  String doctorName;
  final String date;
  final String time;
  final String speciality;
  const BookingDetails({super.key, required this.doctorName, required this.date, required this.time, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width / 1.2,
        height: Get.height / 2.5,
        margin: EdgeInsets.only(top: 10, bottom: Get.height / 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorManager.white2,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: [
            CustomTextWidget(
              Txt: 'تفاصيل الحجز',
              color: ColorManager.black,
              size: 20,
              fontweight: FontWeight.bold,
              spacing: 0,
            ),
            const DividerWidget(),
             detailWidget(
              txtleft: 'الدكتور',
              textright: 'د. $doctorName',
            ),
            const DividerWidget(
              color: ColorManager.lightGrey,
            ),
             detailWidget(
              txtleft: 'التاريخ ',
              textright: date,
            ),
            const DividerWidget(
              color: ColorManager.lightGrey,
            ),
             detailWidget(
              txtleft: 'الوقت',
              textright: time,
            ),
            const DividerWidget(
              color: ColorManager.lightGrey,
            ),
             detailWidget(
              txtleft: 'الاختصاص',
              textright: speciality,
            ),
          ],
        ));
  }
}

class detailWidget extends StatelessWidget {
  final String txtleft;
  final String textright;
  const detailWidget({
    super.key,
    required this.txtleft,
    required this.textright,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          Txt: textright,
          color: ColorManager.blackLight,
          size: Get.width / 20,
          fontweight: FontWeight.w500,
          spacing: 0,
        ),
        const Spacer(),
        CustomTextWidget(
          Txt: txtleft,
          color: ColorManager.black,
          size: Get.width / 18,
          fontweight: FontWeight.bold,
          spacing: 0,
        ),
      ],
    );
  }
}
