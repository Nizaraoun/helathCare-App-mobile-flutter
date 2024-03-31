import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/searchfiled.dart';
import '../../../controller/home/profile/image_picker_controller.dart';
import '../../../widgets/customlistview.dart';
import '../../../widgets/customtext.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../widgets/dropdown.dart';

class MedicalDoc extends StatelessWidget {
  MedicalDoc({super.key});
  ImageControllerImp controller = Get.put(ImageControllerImp());
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
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
          centerTitle: true,
          title: CustomTextWidget(
            Txt: 'الملف الطبي',
            size: 20,
            color: ColorManager.black,
            spacing: 2,
            fontfamily: 'Cairo',
            fontweight: FontWeight.w600,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 11.5,
              child: SerchField(
                height: Get.height / 11.5,
                icon: IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
                texthint: "  بحث",
                inputType: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
            ),

            const Gap(20),
            //*********** add ********
            Row(
              children: [
                CustomIconButton(
                  icon: const Icon(Icons.add_circle_rounded),
                  onPressed: () {
                    showDialog(
                      traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: Get.width * 0.9,
                          height: Get.height / 3,
                          child: const AlertDialog(
                            title: Center(child: Text("أضافة ملف جديد")),
                            actions: [
                              // CustomDropdownButton(
                              //   item: genderItems,
                              //   selectedValue: selectedValue,
                              // ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  color: ColorManager.blueprimaryColor,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ColorManager.lightGrey2,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  tooltip: "أضافة ملف جديد",
                  iconSize: Get.width / 12,
                  alignment: Alignment.centerLeft,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  autofocus: true,
                ),
                const Spacer(),
                CustomTextWidget(
                  Txt: 'الملفات الطبية',
                  color: ColorManager.grey1,
                  size: Get.width / 20,
                  fontweight: FontWeight.w600,
                  spacing: 1,
                ),
              ],
            ),
            Gap(Get.height * 0.03),
            SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.25,
                child: CustomListView(
                    reverse: true,
                    direction: Axis.horizontal,
                    count: 15,
                    itemBuilder: (index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            width: Get.width / 3,
                            height: Get.height / 6.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ColorManager.darkOrange.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: const Offset(
                                      2, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomIconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.delete_forever_outlined),
                                  alignment: Alignment.topLeft,
                                  color: ColorManager.grey2,
                                  iconSize: Get.width / 15,
                                  tooltip: "حذف الملف",
                                  visualDensity:
                                      VisualDensity.adaptivePlatformDensity,
                                  autofocus: true,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/folder.png",
                                    width: Get.width / 6.4,
                                    height: Get.height / 12.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomTextWidget(
                            Txt: 'الملف رقم ${index + 1}',
                            color: ColorManager.black,
                            size: Get.width / 17,
                            fontweight: FontWeight.w300,
                            spacing: 0,
                          ),
                        ],
                      );
                    })),
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
