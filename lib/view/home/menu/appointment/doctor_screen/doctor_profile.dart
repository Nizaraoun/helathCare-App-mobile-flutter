import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/controller/home/doctor/reservation_controller.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/home/menu/appointment/confirmation.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../../controller/home/home_page/chat_controller.dart';
import '../../../../../controller/home/home_page/homepagecontorller.dart';
import '../../../../../model/doctor.dart';
import '../../../../../utils/global/show_image.dart';
import '../../../../../widgets/custom_icone_button.dart';
import '../../../home page/doctor_section/widget/CustomDocotrDetails.dart';
import 'rende_vous.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorProfile extends StatelessWidget {
  final int index;
  const DoctorProfile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerimp controller = Get.put(HomePageControllerimp());
    ReservationControllerImp controller1 = Get.put(ReservationControllerImp());
    ChatController chatController = Get.put(ChatController());
    List<int> decodedBytes = base64.decode(controller.doctorDto[index].image!);
    String originalString = utf8.decode(decodedBytes);
    ShowImage().loadImage(originalString);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                AppRoutes().goToEnd(AppRoutes.home);
              },
            ),
            centerTitle: true,
            title: CustomTextWidget(
              Txt: 'تفاصيل الطبيب',
              size: 20,
              color: ColorManager.black,
              spacing: 0,
              fontfamily: 'Cairo',
              fontweight: FontWeight.bold,
            )),
        body: Positioned(
          top: 5,
          child: Column(children: [
            Container(
                width: Get.width / 1.1,
                height: Get.height / 5.5,
                margin: const EdgeInsets.only(top: 5, right: 10, left: 10),
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: controller.image.value?.image ??
                                const AssetImage("assets/images/userimage.png"),
                          ),
                        ))),
                    Gap(Get.width / 20),
                    Expanded(
                        flex: 6,
                        //*********** DOCOTR DETAILS********
                        child: DoctorDetails(
                          controller: controller,
                          index: index,
                          doctorname: controller.doctorDto[index].name ?? " ",
                          namesize: Get.width / 23,
                          fontweightname: FontWeight.w700,
                          specialitytextsiz: Get.width / 25,
                          specialityweight: FontWeight.w400,
                          spacing: 5.5,
                          fontsizerating: TextStyle(fontSize: Get.width / 25),
                          sizerating: Get.width / 25,
                          fontweightrating: FontWeight.w400,
                          iconsizerating: Get.width / 25,
                        )),
                  ],
                )),

            //Get rendevous widget with the idPraticien
            const RendVous(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomIconButton(
                    icon: const Icon(FontAwesomeIcons.facebookMessenger),
                    onPressed: () {
                      chatController.doctorList.add(
                        DoctorDto(
                          id: controller.doctorDto[index].id,
                          name: controller.doctorDto[index].name,
                          speciality: controller.doctorDto[index].speciality,
                        ),
                      );
                      chatController
                          .getMessagesById(controller.doctorDto[index].id!);

                      AppRoutes().goTo(
                        AppRoutes.chat,
                      );
                    },
                    color: ColorManager.primaryColor,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorManager.greenrate,
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
                  CustomElevatedButton(
                      txt: 'حجز موعد',
                      txtcolor: ColorManager.black,
                      size: 20,
                      color: ColorManager.primaryColor,
                      heightsize: Get.height / 15,
                      widthsize: Get.width / 1.5,
                      bordercolor: ColorManager.primaryColor,
                      weight: FontWeight.bold,
                      onPressed: () {
                        Get.to(() => ConfirmationAppointment(
                          date: controller1.selectedDate.toString().split(' ')[0],
                          time: controller1.timeSlots[controller1.reservation[0]],
                              doctorName: controller.doctorDto[index].name!,
                              speciality:
                                  controller.doctorDto[index].speciality!,
                            ));
                      })
                ],
              ),
            ),
          ]),
        ));
  }
}
