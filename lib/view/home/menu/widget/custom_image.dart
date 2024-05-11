import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';

import '../../../../widgets/customtext.dart';
import '../../../resources/color/color_manager.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
              child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
          )),
          const Gap(10),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.ltr,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomIconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_rounded),
                            alignment: Alignment.topLeft,
                            color: ColorManager.blueprimaryColor,
                            iconSize: Get.width / 15,
                            tooltip: "مشاركة",
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            autofocus: true,
                          ),
                          CustomTextWidget(
                            Txt: " مشاركة",
                            color: ColorManager.blueprimaryColor,
                            size: Get.width / 18,
                            fontweight: FontWeight.w300,
                            spacing: 0,
                          )
                        ],
                      )),
                ],
              )),
        ],
      ),
    ));
  }
}
