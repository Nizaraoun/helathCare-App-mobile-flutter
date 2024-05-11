import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/utils/global/show_image.dart';
import 'package:sahtech/view/home/doctor_screen/doctor_profile.dart';
import 'package:sahtech/view/resources/color/constant.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../widgets/customlistview.dart';
import '../../../resources/color/color_manager.dart';
import 'widget/CustomDocotrDetails.dart';
import 'widget/skeleton.dart';

class TopDoctor extends StatelessWidget {
  const TopDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerimp controller = Get.put(HomePageControllerimp());

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: ColorManager.blackLight,
              shadows: const [BoxShadow(color: ColorManager.white)]),
          backgroundColor: ColorManager.white,
          elevation: 0,
          title: CustomTextWidget(
            Txt: "أفضل الأطباء",
            size: Get.width / 20,
            color: ColorManager.blackLight,
            fontweight: FontWeight.w700,
            spacing: 0,
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const NewsCardSkelton(),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: defaultPadding),
            );
          } else {
            return CustomListView(
                reverse: false,
                direction: Axis.vertical,
                count: controller.doctorDto.length,
                itemBuilder: (index) {
                  List<int> decodedBytes =
                      base64.decode(controller.doctorDto[index].image!);
                  String originalString = utf8.decode(decodedBytes);
                  ShowImage().loadImage(originalString);

                  return Container(
                      width: Get.width / 1.1,
                      height: Get.height / 5.5,
                      margin:
                          const EdgeInsets.only(top: 5, right: 10, left: 10),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.grey5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                  decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: controller.image.value?.image ??
                                      const AssetImage(
                                          "assets/images/userimage.png"),
                                ),
                              ))),
                          Gap(Get.width / 20),
                          Expanded(
                              flex: 6,
                              //*********** DOCOTR DETAILS********
                              child: DoctorDetails(
                                controller: controller,
                                index: index,
                                doctorname:
                                    controller.doctorDto[index].name ?? " ",
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
                          CustomElevatedButton(
                            size: Get.width / 25,
                            widthsize: Get.width / 30,
                            heightsize: Get.height / 25,
                            onPressed: () {
                              Get.to(() => DoctorProfile(
                                    index: index,
                                  ));
                            },
                            color: ColorManager.primaryColor,
                            txt: 'المزيد',
                            txtcolor: ColorManager.white,
                          )
                        ],
                      ));
                });
          }
        }));
  }
}
