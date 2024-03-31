import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/home/home%20page/doctor_section/widget/constant.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../widgets/customlistview.dart';
import '../../../resources/color/color_manager.dart';
import '../../../resources/size_config.dart';
import 'widget/CustomDocotrDetails.dart';
import 'widget/Skeleton.dart';

class TopDoctor extends StatelessWidget {
  TopDoctor({
    super.key,
  });
  HomePageControllerimp controller = Get.put(HomePageControllerimp());

  @override
  Widget build(BuildContext context) {
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
                count: controller.doctorDto.length ?? 0,
                itemBuilder: (index) {
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
                        ],
                      ));
                });
          }
        }));
  }
}
