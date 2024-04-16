import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/custom_text_field.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../controller/home/home_page/chat_controller.dart';
import '../../../controller/home/profile/image_picker_controller.dart';
import '../../../model/chat.dart';
import '../../../widgets/searchfiled.dart';
import '../home page/doctor_section/widget/constant.dart';
import '../home page/doctor_section/widget/skeleton.dart';
import '../home page/widget/drawer.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.Spring1,
                ColorManager.Spring2,
                ColorManager.Spring3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Gap(20),
                          Row(
                            children: [
                              CustomIconButton(
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
                          const Gap(20),
                          SizedBox(
                            height: Get.height / 10.5,
                            child: SerchField(
                              color: ColorManager.blueprimaryColor,
                              inputType: TextInputType.text,
                              icon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search)),
                              texthint: "بحث",
                              validator: (p0) {
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: FutureBuilder(
                          future: Future.delayed(
                            const Duration(seconds: 1),
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                chatController.chatList.isEmpty) {
                              return ListView.separated(
                                itemCount: chatController.chatList.length,
                                itemBuilder: (context, index) =>
                                    const NewsCardSkelton(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: defaultPadding),
                              );
                            } else {
                              return ListView.builder(
                                  itemCount: chatController.chatList.length,
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          chatController.doctorname =
                                              chatController
                                                  .chatList[index].name;
                                          AppRoutes().goTo(AppRoutes.chat);
                                        },
                                        child: ListTile(
                                          leading: const BulleMessage(),
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
          ),
        ));
  }
}

class BulleMessage extends StatelessWidget {
  const BulleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageControllerImp controller = Get.put(ImageControllerImp());
    return CustomProfieImage(redius: Get.width / 10, controller: controller);
  }
}
