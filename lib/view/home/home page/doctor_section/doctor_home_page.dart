import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/custom_text_field.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../../widgets/customlistview.dart';
import '../../../../widgets/searchfiled.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: CustomTextWidget(
              Txt: " أختر طبيبك",
              size: Get.width / 16,
              color: ColorManager.black,
              fontweight: FontWeight.bold,
              spacing: 0,
            )),
        body: Column(
          children: [
            SerchField(
              height: 50,
              icon: IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {},
              ),
              texthint: "ابحث عن طبيبك",
              inputType: TextInputType.text,
              validator: (value) {},
            ),
            const Gap(20),
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                CustomSpecialite(
                    path: Categoryassets.brain,
                    txt: StringsManager().categorylist[0]),
                CustomSpecialite(
                    path: Categoryassets.tooth,
                    txt: StringsManager().categorylist[1]),
                CustomSpecialite(
                    path: Categoryassets.cardiology,
                    txt: StringsManager().categorylist[2]),
                CustomSpecialite(
                    path: Categoryassets.lungs,
                    txt: StringsManager().categorylist[3]),
                CustomSpecialite(
                    path: Categoryassets.surgeon,
                    txt: StringsManager().categorylist[4]),
                CustomSpecialite(
                    path: Categoryassets.ophtalmology,
                    txt: StringsManager().categorylist[5]),
                // CustomSpecialite(),
              ],
            ),
          ],
        ));
  }
}

class CustomSpecialite extends StatelessWidget {
  final String txt;
  final String path;
  const CustomSpecialite({
    super.key,
    required this.path,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              path,
              width: Get.width / 7,
              height: Get.height / 15,
            )),
        const Gap(20),
        CustomTextWidget(
          Txt: txt,
          size: Get.width / 25,
          color: ColorManager.black,
          fontweight: FontWeight.bold,
          spacing: 0,
        ),
      ],
    );
  }
}
