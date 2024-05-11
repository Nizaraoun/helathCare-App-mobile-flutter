import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/home/home%20page/widget/drawer.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';

import '../../../../controller/home/profile/image_picker_controller.dart';
import '../../../../controller/home/profile/profile_controller.dart';
import '../../../../widgets/customtext.dart';
import '../../../../widgets/dvider.dart';

class ProfieScreen extends StatelessWidget {
  const ProfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageControllerImp controller = Get.put(ImageControllerImp());
    ProfileController controller2 = Get.put(ProfileControllerImp());

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: Get.height * 0.005, right: 10),
                width: Get.width,
                height: Get.height / 3,
                decoration: BoxDecoration(
                  color: ColorManager.move,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                      onPressed: () {
                        Get.back();

                        // Navigator.pop(context);
                      },
                      alignment: Alignment.center,
                      visualDensity: VisualDensity.compact,
                      color: ColorManager.blackLight,
                      autofocus: false,
                    ),
                    const Spacer(),
                    CustomIconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.solidBell,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      padding: const EdgeInsets.only(
                          top: 15, right: 10, left: 10, bottom: 15),
                      alignment: Alignment.center,
                      visualDensity: VisualDensity.compact,
                      color: const Color.fromARGB(193, 0, 0, 0),
                      autofocus: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 10),
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: ColorManager.blackLight,
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                    color: ColorManager.white,
                  ),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(Get.height / 10),
                        CustomTextWidget(
                          Txt: controller2.profile[0].username,
                          size: Get.width / 16,
                          color: ColorManager.black,
                          fontweight: FontWeight.bold,
                          spacing: 2,
                        ),
                        const Gap(10),
                        Container(
                          height: Get.height / 3.5,
                          width: Get.width / 1.07,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                color: ColorManager.grey4,
                                blurRadius: 15,
                                spreadRadius: 0.54,
                                offset: const Offset(0, 0),
                              )
                            ],
                            color: ColorManager.transparent1,
                            border: Border.all(
                              color: ColorManager.grey5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                textDirection: TextDirection.ltr,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(children: [
                                    //email
                                    CustomInfo(
                                        subtitlesize: Get.width / 30,
                                        icon: Icons.email,
                                        title: "البريد الالكتروني",
                                        subtitle: controller2.profile[0].email),
                                    //phone
                                    CustomInfo(
                                        subtitlesize: Get.width / 26,
                                        icon: Icons.phone,
                                        title: "رقم الهاتف",
                                        subtitle: controller2.profile[0].phone),
                                    //address

                                    CustomInfo(
                                        subtitlesize: Get.width / 26,
                                        icon: Icons.location_on,
                                        title: "العنوان",
                                        subtitle: "gabes tunisia"),
                                  ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomInfo(
                                            subtitlesize: Get.width / 30,
                                            icon: FontAwesomeIcons.birthdayCake,
                                            title: "تاريخ الميلاد",
                                            subtitle: "01/01/1990"),
                                        CustomInfo(
                                            subtitlesize: Get.width / 30,
                                            icon: FontAwesomeIcons.venusMars,
                                            title: "الجنس",
                                            subtitle: "ذكر"),
                                      ]),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 0,
                              left: Get.width / 2,
                              top: Get.height * 0.03),
                          child: CustomTextWidget(
                            Txt: " الاعدادات العامة ",
                            size: Get.width / 20,
                            color: ColorManager.black,
                            fontweight: FontWeight.bold,
                            spacing: 0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Get.height * 0.02),
                          height: Get.height / 7.5,
                          width: Get.width / 1.05,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                color: ColorManager.grey4,
                                blurRadius: 15,
                                spreadRadius: 0.54,
                                offset: const Offset(0, 0),
                              )
                            ],
                            color: ColorManager.transparent1,
                            border: Border.all(
                              color: ColorManager.grey5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const Gap(10),
                              GestureDetector(
                                onTap: () {
                                  //AppRoutes().goTo(AppRoutes.newpassword);
                                },
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(Get.width / 20),
                                    Icon(
                                      FontAwesomeIcons.userLock,
                                      color: ColorManager.darkOrange,
                                    ),
                                    CustomTextWidget(
                                      Txt: "تغيير كلمة المرور  ",
                                      size: Get.width / 22,
                                      color: ColorManager.black,
                                      fontweight: FontWeight.bold,
                                      spacing: 0,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      FontAwesomeIcons.chevronLeft,
                                      color: ColorManager.darkOrange,
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Row(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Gap(Get.width / 20),
                                  Icon(
                                    FontAwesomeIcons.solidBellSlash,
                                    color: ColorManager.darkOrange,
                                  ),
                                  Gap(Get.width * 0.01),
                                  CustomTextWidget(
                                    Txt: " الاشعارات ",
                                    size: Get.width / 22,
                                    color: ColorManager.black,
                                    fontweight: FontWeight.bold,
                                    spacing: 0,
                                  ),
                                  const Spacer(),
                                  Switch(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: ColorManager.darkOrange,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: Get.height / 30,
                  left: Get.width / 3,
                  child: CustomProfieImage(controller: controller, redius: 60)),
            ],
          ),
        ));
  }
}

class CustomInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double subtitlesize;
  const CustomInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.subtitlesize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width / 1.6,
        child: ListTile(
          enableFeedback: false,
          leading: Icon(
            icon,
            color: ColorManager.darkOrange,
          ),
          title: CustomTextWidget(
            Txt: title,
            size: Get.width / 25,
            color: ColorManager.black,
            fontweight: FontWeight.bold,
            spacing: 0,
          ),
          subtitle: CustomTextWidget(
            Txt: subtitle,
            size: subtitlesize,
            color: ColorManager.blackLight,
            fontweight: FontWeight.bold,
            spacing: 0,
          ),
        ));
  }
}
