import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import '../../../controller/home/profile/image_picker_controller.dart';
import '../../../utils/app_routes.dart';
import '../../../widgets/customtext.dart';
import '../home page/widget/drawer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MedicalDoc extends StatelessWidget {
  MedicalDoc({super.key});
  ImageControllerImp controller = Get.put(ImageControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightGrey2,
      floatingActionButton: SpeedDial(
        curve: Curves.easeInOutCirc,
        icon: Icons.folder,
        buttonSize: const Size(60, 60),
        activeIcon: Icons.close,
        activeBackgroundColor: ColorManager.darkOrange,
        // animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        backgroundColor: ColorManager.darkOrange,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.camera_alt_rounded),
            backgroundColor: ColorManager.darkOrange,
            label: 'الكاميرا',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () async {
              await controller.selectImage();
              if (controller.image.value != null) {}
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.photo),
            backgroundColor: ColorManager.darkOrange,
            label: 'الصور',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () async {
              await controller.selectImage();
              if (controller.image.value != null) {}
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('MedicalDoc'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            GestureDetector(
                child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              width: Get.width,
              height: Get.height / 6,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorManager.darkOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CustomProfieImage(
                        controller: controller,
                        redius: 30,
                      ),
                      Gap(Get.width / 20),
                      CustomTextWidget(
                        Txt: 'نزار عون',
                        color: ColorManager.blackLight,
                        size: Get.width / 15,
                        fontweight: FontWeight.bold,
                        spacing: 0,
                      ),
                    ],
                  ),
                  Gap(Get.height / 40),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      CustomTextWidget(
                        Txt: ': رقم الملف الطبي',
                        color: ColorManager.darkBlue,
                        size: 20,
                        fontweight: FontWeight.bold,
                        spacing: 0,
                      ),
                      CustomTextWidget(
                        Txt: '15229 ',
                        color: ColorManager.blackLight,
                        size: 20,
                        fontweight: FontWeight.bold,
                        spacing: 0,
                      ),
                    ],
                  ),
                ],
              ),
            )),
            const Gap(20),
            // CustomImageDoc(
            //   picture: controller.image.value!,

            // )
          ],
        ),
      ),
    );
  }
}

class CustomImageDoc extends StatelessWidget {
  const CustomImageDoc({
    super.key,
    required this.picture,
  });
  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      width: Get.width,
      height: Get.height / 3,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: ColorManager.lightGrey2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
    );
  }
}
