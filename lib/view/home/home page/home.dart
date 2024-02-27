import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/view/resources/strings_manager.dart';
import 'package:sahtech/widgets/custom_text_field.dart';
import '../../../utils/app_routes.dart';
import '../../../widgets/custom_icone_button.dart';
import '../../../widgets/custom_inkwell_widget.dart';
import '../../../widgets/customlistview.dart';
import '../../../widgets/customtext.dart';
import '../../resources/assets_manager.dart';
import 'widget/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              CustomTextWidget(
                Txt: "مرحبا بكم في صحتك",
                size: Get.width / 16,
                color: Colors.black,
                fontweight: FontWeight.bold,
                spacing: 0,
              ),
              const Spacer(),
              CustomIconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                color: ColorManager.blackLight,
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
                tooltip: "الاشعارات",
                iconSize: Get.width / 12,
                alignment: Alignment.centerLeft,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                autofocus: true,
              ),
            ],
          ),
          Gap(Get.height / 20),
          SizedBox(
            height: Get.height / 11.5,
            child: CustomTextFormField(
              icon: const Icon(Icons.search_rounded),
              texthint: "اطباء ,  دواء ,   بحث",
              inputType: TextInputType.text,
              validator: (value) {
                return null;

                // if (value!.isEmpty) {
                //   return "الرجاء ادخال البيانات";
                // }
              },
            ),
          ),
          Gap(Get.height / 20),
          SizedBox(
            height: Get.height / 5,
            width: Get.width,
            child: CustomListView(
              count: 5,
              itemBuilder: (index) {
                return GestureDetector(
                    onTap: () {
                      AppRoutes()
                          .goTo(AppRoutes().serviceRouting[index].toString());
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "$imagePath${Serviceassets().serviceassets[index]}.png",
                          width: Get.width / 5,
                          height: Get.height / 12,
                        ),
                        const Gap(10),
                        CustomTextWidget(
                          Txt: StringsManager().servicelist[index],
                          size: Get.width / 16,
                          color: ColorManager.grey2,
                          fontweight: FontWeight.bold,
                          spacing: 0,
                        ),
                      ],
                    ));
              },
            ),
          ),
          SizedBox(
            height: Get.height / 5,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorManager.lightGrey2,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ColorManager.grey,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/doctor1.png",
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: 10,
              itemWidth: Get.width * 0.85,
              layout: SwiperLayout.STACK,
            ),
          ),
          const Gap(20),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              CustomTextWidget(
                Txt: "أفضل الأطباء",
                size: Get.width / 20,
                color: ColorManager.blackLight,
                fontweight: FontWeight.bold,
                spacing: 0,
              ),
              const Spacer(),
              CustomInkWellWidget(
                ontap: () {},
                widget: CustomTextWidget(
                  Txt: "عرض المزيد",
                  size: Get.width / 20,
                  color: ColorManager.primaryColor,
                  fontweight: FontWeight.w400,
                  spacing: 0,
                ),
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            width: Get.width * 0.9,
            height: Get.height / 4,
            child: CustomListView(
                count: 5,
                itemBuilder: (index) {
                  return Container(
                    width: Get.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: ColorManager.lightGrey2, width: 1.5),
                    ),
                    child: GestureDetector(
                        onTap: () {},
                        child: Column(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorManager.grey,
                            ),
                            height: Get.height / 10,
                            width: Get.width / 5,
                            child: Image.asset(
                              "assets/images/doctor1.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ])),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
