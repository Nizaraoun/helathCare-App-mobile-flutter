import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/controller/home/home_page/chat_controller.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import '../../../../controller/authentification/auth_controller.dart';
import '../../../../controller/home/feed/feed_controller.dart';
import '../../../../controller/home/profile/image_picker_controller.dart';
import '../../../../utils/app_routes.dart';
import '../../../../widgets/custom_alert_dialog.dart';
import '../../../../widgets/customtext.dart';
import '../../../resources/color/color_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ImageControllerImp controller = Get.put(ImageControllerImp());
    AthControllerImp controller2 = Get.put(AthControllerImp());
    ChatController chatController = Get.put(ChatController());
    FeedControllerImp feedController = Get.put(FeedControllerImp());

    return Drawer(
      clipBehavior: Clip.hardEdge,
      width: Get.width / 1.2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 3.5,
            decoration: const BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(children: [
              const Gap(20),
              Stack(
                fit: StackFit.loose,
                children: [
                  CustomProfieImage(
                      redius: Get.width / 8, controller: controller),
                  Positioned(
                      right: 0,
                      top: Get.width / 7,
                      child: CustomIconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () async {
                          await controller.selectImage();
                        },
                        color: ColorManager.blackLight,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            ColorManager.lightGrey2,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        tooltip: "الاشعارات",
                        iconSize: Get.width / 15,
                        alignment: Alignment.centerLeft,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        autofocus: true,
                      ))
                ],
              ),

              const Gap(25),
              // CustomTextWidget(
              //   Txt: controller2.getuserinfo(),
              //   size: Get.width / 16,
              //   color: Colors.white,
              //   fontweight: FontWeight.bold,
              //   spacing: 0,
              // ),
              // bch tkoun feha les info el health mta3 el user
              const Row(
                children: [],
              )
            ]),
          ),
          Column(
            children: [
              Custom_Menu_Item(
                onTap: () {
                  
                  AppRoutes().goTo(AppRoutes.feedsScreen);
                },
                txt: "المنشورات",
                icon: FontAwesomeIcons.newspaper,
              ),
              Custom_Menu_Item(
                onTap: () {
                  AppRoutes().goTo(AppRoutes.medicalDoc);
                },
                txt: "الملف الشخصي",
                icon: Icons.person,
              ),
              Custom_Menu_Item(
                  onTap: () {
                    chatController.getChatList();
                    AppRoutes().goTo(AppRoutes.conversation);
                  },
                  txt: "المحادثات",
                  icon: FontAwesomeIcons.facebookMessenger),
              Custom_Menu_Item(
                  onTap: () {
                    AppRoutes().goTo(AppRoutes.appointment);
                  },
                  txt: "المواعيد",
                  icon: FontAwesomeIcons.calendarDay),
              Custom_Menu_Item(
                onTap: () {
                  AppRoutes().goTo(AppRoutes.profile);
                },
                txt: "الاعدادات",
                icon: Icons.settings,
              ),
              Custom_Menu_Item(
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      traversalEdgeBehavior: TraversalEdgeBehavior.parentScope,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            width: Get.width,
                            height: Get.height / 2,
                            child: CustomAlertDialog(
                              onpressed: () {
                                controller2.logout();
                              },
                              title: "هل انت متأكد من تسجيل الخروج؟",
                              icone: FontAwesomeIcons.signOutAlt,
                              color: ColorManager.primaryColor,
                            ));
                      });
                },
                txt: "تسجيل الخروج",
                txtcolor: Colors.red,
                color: ColorManager.red,
                icon: Icons.logout,
              )
            ],
          )
        ],
      )),
    );
  }
}

class CustomProfieImage extends StatelessWidget {
  final double redius;

  const CustomProfieImage({
    super.key,
    required this.controller,
    required this.redius,
  });

  final ImageControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: redius,
      backgroundImage: controller.image.value?.image ??
          const AssetImage("assets/images/userimage.png"),
    );
  }
}

// ignore: camel_case_types
class Custom_Menu_Item extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final Color txtcolor;
  final String txt;
  final IconData icon;
  const Custom_Menu_Item({
    super.key,
    this.txtcolor = Colors.black,
    this.color = ColorManager.primaryColor,
    required this.onTap,
    required this.txt,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(right: 20),
        height: Get.height / 12,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          border: Border.all(color: ColorManager.lightGrey2, width: 2.5),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              maxRadius: Get.width / 18,
              child: Icon(
                icon,
                color: color,
                shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
                size: Get.width / 12,
              ),
            ),
            const Gap(20),
            CustomTextWidget(
              Txt: txt,
              size: Get.width / 16,
              color: txtcolor,
              fontweight: FontWeight.bold,
              spacing: 0,
            ),
          ],
        ),
      ),
    );
  }
}
