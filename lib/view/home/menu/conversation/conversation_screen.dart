import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/model/doctor.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/home/home%20page/home.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../controller/home/home_page/chat_controller.dart';
import '../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../controller/home/profile/image_picker_controller.dart';
import '../../../../utils/global/show_image.dart';
import '../../../../widgets/searchfiled.dart';
import '../../../resources/color/constant.dart';
import '../../home page/doctor_section/widget/skeleton.dart';
import '../../home page/widget/drawer.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    HomePageControllerimp controller = Get.put(HomePageControllerimp());
    return Scaffold(
        backgroundColor: ColorManager.move,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomIconButton(
                              icon: const Icon(Icons.arrow_back_ios_rounded),
                              onPressed: () {
                                AppRoutes().goToEnd(AppRoutes.home);
                              },
                              color: ColorManager.blackLight,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  ColorManager.lightGrey3,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(42),
                                  ),
                                ),
                              ),
                              tooltip: "الرجوع",
                              iconSize: Get.width / 16,
                              alignment: Alignment.centerRight,
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              autofocus: true,
                            ),
                          ),
                          const Spacer(),
                          CustomIconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {},
                            color: ColorManager.blackLight,
                            tooltip: "الرجوع",
                            iconSize: Get.width / 14,
                            alignment: Alignment.centerRight,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            autofocus: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 9,
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.grey2,
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 242, 248, 243), // #ebedee
                          Color.fromARGB(255, 255, 255, 255), // #fdfbfb
                        ],
                        stops: [0.0, 1.0],
                        transform:
                            GradientRotation(120 * (3.141592653589793 / 180)),
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: FutureBuilder(
                        future: Future.delayed(
                          const Duration(seconds: 3),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              !controller.isLoading.value) {
                            return ListView.separated(
                              itemCount: 6,
                              itemBuilder: (context, index) =>
                                  const NewsCardSkelton(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: defaultPadding),
                            );
                          } else {
                            return Obx(() {
                              return ListView.builder(
                                  itemCount: chatController.chatList.length,
                                  itemBuilder: (context, index) {
                                    List<int> decodedBytes = base64.decode(
                                        chatController.chatList[index].image!);
                                    String originalString =
                                        utf8.decode(decodedBytes);
                                    ShowImage().loadImage(originalString);

                                    return GestureDetector(
                                      onTap: () {
                                        chatController
                                            .createAblyRealtimeInstance();
                                        chatController.getMessagesById(
                                            chatController
                                                .chatList[index].doctorId!);

                                        chatController.doctorList.add(DoctorDto(
                                            id: chatController
                                                .chatList[index].doctorId,
                                            name: chatController
                                                .chatList[index].name,
                                            speciality: ""));

                                        AppRoutes().goTo(AppRoutes.chat);
                                      },
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorManager.blue,
                                            ),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              filterQuality: FilterQuality.high,
                                              alignment: Alignment.center,
                                              image: controller
                                                      .image.value?.image ??
                                                  const AssetImage(
                                                      "assets/images/userimage.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          width: Get.width / 6.8,
                                          height: Get.width / 6,
                                        ),

                                        title: CustomTextWidget(
                                          fontfamily: "Cairo",
                                          Txt: chatController
                                              .chatList[index].name,
                                          color: ColorManager.black,
                                          size: Get.width / 19,
                                          fontweight: FontWeight.w500,
                                          spacing: 0,
                                        ), // Display the name of the chat participant
                                        subtitle: Text(
                                          ChatController.extractMessage(
                                              chatController
                                                  .chatList[index].msg),
                                        ),

                                        // Display the last message
                                        trailing: Text(chatController
                                            .chatList[index]
                                            .lastmsg), // Display the time
                                      ),
                                    );
                                  });
                            });
                          }
                        })))
          ],
        ));
  }
}
