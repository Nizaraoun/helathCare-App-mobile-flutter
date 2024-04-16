import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/custom_text_field.dart';
import 'package:sahtech/widgets/searchfiled.dart';
import '../../../controller/home/medical_doc/medical_document_controller.dart';
import '../../../controller/home/profile/image_picker_controller.dart';
import '../../../model/document.dart';
import '../../../utils/global/validtion_input.dart';
import '../../../widgets/customlistview.dart';
import '../../../widgets/customtext.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../widgets/dvider.dart';

class MedicalDoc extends StatelessWidget {
  const MedicalDoc({super.key});

  @override
  Widget build(BuildContext context) {
    // String? selectedValue;

    // final List<String> genderItems = [
    //   'Male',
    //   'Female',
    // ];
    ImageControllerImp controller = Get.put(ImageControllerImp());
    MedicalDocumentimp documentcontroller = Get.put(MedicalDocumentimp());

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
                color: ColorManager.darkOrange,
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
            Row(
              children: [
                CustomIconButton(
                  icon: const Icon(Icons.add_circle_rounded),
                  onPressed: () {
                    showDialog(
                      barrierDismissible: true,
                      traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: Get.width * 0.9,
                          height: Get.height / 3,
                          child: StreamBuilder<Object>(
                              stream: documentcontroller.documentDto.stream,
                              builder: (context, snapshot) {
                                return AlertDialog(
                                  backgroundColor: ColorManager.lightOrange,
                                  actionsAlignment: MainAxisAlignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.center,
                                  title: const Center(
                                      child: Text("أضافة ملف جديد")),
                                  actions: [
                                    Form(
                                      key: documentcontroller.formdocument,
                                      child: CustomTextFormField(
                                          icon: const Icon(
                                              Icons.add_circle_rounded),
                                          texthint: "أدخل اسم الملف",
                                          inputType: TextInputType.text,
                                          validator: (value) {
                                            documentcontroller.docName = value!;
                                            return value.isEmpty
                                                ? "الرجاء ادخال اسم الملف"
                                                : null;
                                          }),
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          documentcontroller.adddocument();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            ColorManager.darkOrange,
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: const Text("أضافة"),
                                      ),
                                    ),
                                  ],
                                );
                              }),
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
            Obx(
              () => documentcontroller.documentDto.isEmpty
                  ? const Center(
                      heightFactor: 2,
                      child: Image(
                        image: AssetImage("assets/images/nodoc.png"),
                        width: 200,
                        height: 200,
                      ))
                  : SizedBox(
                      width: Get.width * 0.9,
                      height: Get.height * 0.25,
                      child: CustomListView(
                          reverse: true,
                          direction: Axis.horizontal,
                          count: documentcontroller.documentDto.length,
                          itemBuilder: (index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    documentcontroller.selectedDoc.value =
                                        documentcontroller
                                            .documentDto[index].name
                                            .toString();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 5,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    width: Get.width / 3.3,
                                    height: Get.height / 6.9,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.darkOrange
                                              .withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: const Offset(2,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomIconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.delete_forever_outlined),
                                          alignment: Alignment.topLeft,
                                          color: ColorManager.grey2,
                                          iconSize: Get.width / 15,
                                          tooltip: "حذف الملف",
                                          visualDensity: VisualDensity
                                              .adaptivePlatformDensity,
                                          autofocus: true,
                                        ),
                                        Center(
                                          child: Image.asset(
                                            "assets/images/folder.png",
                                            width: Get.width / 6.2,
                                            height: Get.height / 12.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(Get.height * 0.008),
                                CustomTextWidget(
                                  Txt: documentcontroller
                                      .documentDto[index].name
                                      .toString(),
                                  color: ColorManager.black,
                                  size: Get.width / 17,
                                  fontweight: FontWeight.w300,
                                  spacing: 0,
                                ),
                                CustomTextWidget(
                                  Txt:
                                      "  ${documentcontroller.documentDto[index].number} صورة",
                                  color: ColorManager.grey1,
                                  size: Get.width / 21,
                                  fontweight: FontWeight.w300,
                                  spacing: 0,
                                ),
                              ],
                            );
                          })),
            ),
            Gap(Get.height * 0.01),
            SizedBox(width: Get.width, child: const DividerWidget()),
            Gap(Get.height * 0.01),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => documentcontroller.selectedDoc.value.isEmpty
                      ? const Center(
                          child: Text("لا يوجد ملف محدد"),
                        )
                      : CustomTextWidget(
                          Txt: ":  ${documentcontroller.selectedDoc.value} ",
                          color: ColorManager.black,
                          size: Get.width / 18,
                          fontweight: FontWeight.w400,
                          spacing: 0,
                        ),
                ),
              ],
            ),
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
