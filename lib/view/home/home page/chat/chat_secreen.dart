import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../../../../controller/home/home_page/chat_controller.dart';
import '../../../../widgets/custom_icone_button.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.move,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            child: SizedBox(
              width: Get.width,
              child: Row(
                children: [
                  CustomIconButton(
                    alignment: Alignment.centerLeft,
                    visualDensity: VisualDensity.compact,
                    autofocus: true,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      chatController.doctorList.clear();
                      chatController.messages.clear();

                      Get.back();
                    },
                  ),
                  const CircleAvatar(
                    maxRadius: 27,
                    backgroundImage: AssetImage('assets/images/doctor2.png'),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        Txt: chatController.doctorList[0].name ?? 'Doctor Name',
                        size: Get.width / 21,
                        color: ColorManager.black,
                        spacing: 0,
                        fontfamily: 'Cario',
                        fontweight: FontWeight.w800,
                      ),
                      CustomTextWidget(
                        Txt: chatController.doctorList[0].speciality ??
                            'Doctor Specialization',
                        size: Get.width / 27,
                        color: ColorManager.blackLight,
                        spacing: 0,
                        fontfamily: 'Tajwal',
                        fontweight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomIconButton(
                    alignment: Alignment.centerRight,
                    visualDensity: VisualDensity.compact,
                    autofocus: true,
                    icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                    iconSize: Get.width / 15,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height / 7),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: chatController.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = chatController.messages[index];
                        if (message.sender == 'sender') {
                          // Sender message
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: message.body.length > (Get.width / 15)
                                    ? 1
                                    : 0,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(8),
                                  margin: EdgeInsets.only(
                                    top: 8,
                                    right: 16,
                                    left: Get.width / 6.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        chatController.sendingBackgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CustomTextWidget(
                                    Txt: message.body,
                                    size: 18,
                                    color: chatController.sendingTextColor,
                                    spacing: 1.5,
                                    fontfamily: 'Tajwal',
                                    fontweight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Receiver message
                          return Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/doctor2.png'),
                              ),
                              Expanded(
                                  flex: message.body.length > (Get.width / 12)
                                      ? 1
                                      : 0,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(10),
                                    margin: EdgeInsets.only(
                                        top: 15,
                                        left: 16,
                                        right: Get.width / 5.5),
                                    decoration: BoxDecoration(
                                      color: chatController
                                          .receivingBackgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: CustomTextWidget(
                                      Txt: message.body,
                                      size: 15,
                                      color: chatController.receivingTextColor,
                                      spacing: 1.5,
                                      fontfamily: 'Cario',
                                      fontweight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorManager.lightGrey2,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [BoxShadow(blurStyle: BlurStyle.outer)]),
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 10, top: 5),
                  child: Row(
                    children: [
                      CustomIconButton(
                        alignment: Alignment.centerRight,
                        visualDensity: VisualDensity.compact,
                        autofocus: true,
                        icon: const Icon(
                          Icons.mic,
                          color: Color.fromARGB(221, 30, 30, 30),
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: chatController.sendingTextController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(right: 10),
                            border: InputBorder.none,
                            hintText: '....اكتب رسالة هنا',
                          ),
                        ),
                      ),
                      CustomIconButton(
                        alignment: Alignment.centerRight,
                        visualDensity: VisualDensity.compact,
                        autofocus: true,
                        icon: const Icon(
                          Icons.image_outlined,
                          color: Color.fromARGB(221, 30, 30, 30),
                        ),
                        onPressed: () {},
                      ),
                      CustomIconButton(
                        alignment: Alignment.centerRight,
                        visualDensity: VisualDensity.compact,
                        autofocus: true,
                        icon: const Icon(Icons.send_rounded,
                            color: ColorManager.blueprimaryColor),
                        onPressed: () {
                          chatController.sendMessage();
                        },
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //       color: ColorManager.lightGrey2,
                //       borderRadius: BorderRadius.circular(40),
                //       boxShadow: const [BoxShadow(blurStyle: BlurStyle.outer)]),
                //   margin: const EdgeInsets.only(
                //       left: 5, right: 5, bottom: 10, top: 5),
                //   child: Row(
                //     children: [
                //       CustomIconButton(
                //         alignment: Alignment.centerRight,
                //         visualDensity: VisualDensity.compact,
                //         autofocus: true,
                //         icon: const Icon(
                //           Icons.mic,
                //           color: Color.fromARGB(221, 30, 30, 30),
                //         ),
                //         onPressed: () {},
                //       ),
                //       Expanded(
                //         child: TextField(
                //           textAlign: TextAlign.right,
                //           controller: chatController.receivingTextController,
                //           decoration: const InputDecoration(
                //             contentPadding: EdgeInsets.only(right: 10),
                //             border: InputBorder.none,
                //             hintText: '....send message here',
                //           ),
                //         ),
                //       ),
                //       CustomIconButton(
                //         alignment: Alignment.centerRight,
                //         visualDensity: VisualDensity.compact,
                //         autofocus: true,
                //         icon: const Icon(
                //           Icons.image_outlined,
                //           color: Color.fromARGB(221, 30, 30, 30),
                //         ),
                //         onPressed: () {},
                //       ),
                //       CustomIconButton(
                //         alignment: Alignment.centerRight,
                //         visualDensity: VisualDensity.compact,
                //         autofocus: true,
                //         icon: const Icon(Icons.send_rounded,
                //             color: ColorManager.blueprimaryColor),
                //         onPressed: () {
                //           chatController.receiveMessage();
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
