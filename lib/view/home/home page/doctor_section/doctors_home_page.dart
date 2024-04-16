import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/home/home%20page/doctor_section/widget/CustomDocotrDetails.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../widgets/searchfiled.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerimp controller = Get.put(HomePageControllerimp());

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
        body: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 8.0, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SerchField(
                height: 50,
                icon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
                texthint: "ابحث عن طبيبك",
                inputType: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
              const Gap(20),
              Wrap(
                alignment: WrapAlignment.end,
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
                  // CustomSpecialite(
                  //     path: Categoryassets.ophtalmology,
                  //     txt: StringsManager().categorylist[5]),
                  // CustomSpecialite(),
                ],
              ),
              Gap(Get.height / 20),
              CustomTextWidget(
                  Txt: "أفضل الاطباء ",
                  color: ColorManager.blackLight,
                  size: Get.width * 0.05,
                  fontweight: FontWeight.w600,
                  spacing: 0),
              Gap(Get.height / 35),
              SizedBox(
                height: Get.height / 4.5,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        borderOnForeground: true,
                        color: ColorManager.white,
                        child: Container(
                            width: Get.width / 1.1,
                            height: Get.height / 5.5,
                            margin: const EdgeInsets.only(
                                top: 5, right: 10, left: 10),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF5F5F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        "assets/images/doctor1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                                Gap(Get.width / 20),
                                Expanded(
                                    flex: 6,
                                    //*********** DOCOTR DETAILS********
                                    child: DoctorDetails(
                                      controller: controller,
                                      index: index,
                                      doctorname:
                                          controller.doctorDto[index].name ??
                                              " ",
                                      namesize: Get.width / 23,
                                      fontweightname: FontWeight.w700,
                                      specialitytextsiz: Get.width / 25,
                                      specialityweight: FontWeight.w400,
                                      spacing: 5.5,
                                      fontsizerating:
                                          TextStyle(fontSize: Get.width / 25),
                                      sizerating: Get.width / 25,
                                      fontweightrating: FontWeight.w400,
                                      iconsizerating: Get.width / 25,
                                    )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.share),
                                      onPressed: () {},
                                    ),
                                  ],
                                ))
                              ],
                            )));
                  },
                  itemWidth: Get.width * 0.9,
                  layout: SwiperLayout.STACK,
                  itemCount: 4,
                ),
              ),
              Gap(Get.height / 30),
              CustomTextWidget(
                  Txt: " أخر الاطباء",
                  color: ColorManager.blackLight,
                  size: Get.width * 0.05,
                  fontweight: FontWeight.w600,
                  spacing: 0),
              Gap(Get.height / 35),
            ],
          ),
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
