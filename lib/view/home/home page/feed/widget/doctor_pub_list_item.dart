import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahtech/controller/home/feed/feed_controller.dart';
import 'package:sahtech/model/feed.dart';

import '../../../../../widgets/custom_icone_button.dart';
import '../../../../../widgets/customtext.dart';
import '../../../../resources/color/color_manager.dart';

class DoctorPubListItem extends StatelessWidget {
  final Feed doctorPub;

  const DoctorPubListItem({required this.doctorPub, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: CustomTextWidget(
              Txt: doctorPub.userName!,
              color: ColorManager.black,
              size: 18,
              fontweight: FontWeight.w500,
              spacing: 0.1),
          subtitle: CustomTextWidget(
              Txt: doctorPub.createdAt!,
              color: ColorManager.grey1,
              size: 15,
              fontweight: FontWeight.w300,
              spacing: 0.1),
          leading: CircleAvatar(
            radius: Get.width / 16,
            backgroundImage: const AssetImage('assets/images/userimage.png'),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            doctorPub.content!,
            maxLines: 3,
            style: TextStyle(
              overflow: TextOverflow.clip,
              color: ColorManager.black,
              fontSize: Get.width / 25,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.1,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            CustomIconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.solidHeart),
              color: ColorManager.grey,
              iconSize: 20,
              alignment: Alignment.center,
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                    Size(Get.width / 10, Get.height / 19.2)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(ColorManager.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: ColorManager.white3, width: 1),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              autofocus: true,
            ),
            Gap(Get.width / 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.bottomCenter,
                height: 40,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.white3,
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(1, 2),
                      ),
                    ],
                    border: Border.all(color: ColorManager.white1, width: 1),
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(50)),
                width: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.commentMedical,
                      color: ColorManager.grey,
                      size: 18,
                    ),
                    const Gap(5.0),
                    CustomTextWidget(
                      Txt: doctorPub.commentcount.toString(),
                      color: ColorManager.black,
                      size: 18,
                      fontweight: FontWeight.w400,
                      spacing: 0.1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
