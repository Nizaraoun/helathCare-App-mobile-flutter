import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../controller/home/doctor/Appointment_controller.dart';
import '../../../../../model/Appointment.dart';
import '../../../../../widgets/cusomelvatedbutton.dart';
import '../../../../../widgets/custom_alert_dialog.dart';
import '../../../../../widgets/customtext.dart';
import '../../../../resources/color/color_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppointmentBody extends StatelessWidget {
  final String typebody;
  const AppointmentBody({
    super.key,
    required this.appointmencontroller,
    required this.appointments,
    required this.typebody,
  });

  final AppointmentControllerImp appointmencontroller;
  final RxList<Appointments> appointments;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (appointments.isEmpty) {
        return const Center(
          child: Image(image: AssetImage('assets/images/calendar.png')),
        );
      } else {
        return ListView.separated(
          separatorBuilder: (context, index) => Gap(Get.height * 0.01),
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: Get.height / 2.7,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  top: Get.height / 15,
                  bottom: Get.height / 30,
                  child: Container(
                    padding: EdgeInsets.only(top: Get.height * 0.07),
                    width: Get.width / 1.1,
                    height: Get.height / 4,
                    decoration: BoxDecoration(
                      color: ColorManager.Clouds1,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          Txt: appointments[index].doctorname!,
                          color: ColorManager.black,
                          fontweight: FontWeight.bold,
                          spacing: 1.0,
                          fontfamily: 'Tajwal',
                          size: Get.width * 0.05,
                        ),
                        const Gap(5),
                        CustomTextWidget(
                          Txt: appointments[index].speciality!,
                          color: ColorManager.grey1,
                          fontweight: FontWeight.w500,
                          spacing: 1.0,
                          fontfamily: 'Tajawal',
                          size: Get.width * 0.04,
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TimeWidget(
                              icon: FontAwesomeIcons.calendarDays,
                              txt: appointments[index].jour!,
                            ),
                            TimeWidget(
                                icon: FontAwesomeIcons.clock,
                                txt: '${appointments[index].houre} AM'),
                          ],
                        ),
                        const Gap(10),
                        if (typebody == 'upcoming')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomElevatedButton(
                                size: Get.width / 18.5,
                                heightsize: Get.height / 18,
                                widthsize: Get.width / 2.8,
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: true,
                                      traversalEdgeBehavior:
                                          TraversalEdgeBehavior.parentScope,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                            width: Get.width,
                                            height: Get.height / 2,
                                            child: CustomAlertDialog(
                                                color: ColorManager.red,
                                                icone: FontAwesomeIcons
                                                    .heartCircleExclamation,
                                                title:
                                                    'هل انت متأكد من الغاء الموعد؟',
                                                onpressed: () {
                                                  appointmencontroller
                                                      .cancelAppointment(
                                                          appointments[index]
                                                              .id!);
                                                  Get.back();
                                                }));
                                      });
                                },
                                bordercolor: ColorManager.primaryColor,
                                color: ColorManager.white1,
                                txt: 'الغاء',
                                txtcolor: ColorManager.grey1,
                                weight: FontWeight.w500,
                              ),
                              const Gap(10),
                              CustomElevatedButton(
                                size: Get.width / 18.5,
                                heightsize: Get.height / 18,
                                widthsize: Get.width / 2.8,
                                onPressed: () {},
                                bordercolor: ColorManager.primaryColor,
                                color: ColorManager.primaryColor,
                                txt: 'تغيير الموعد',
                                txtcolor: ColorManager.black,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        if (typebody == 'cancelled')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomElevatedButton(
                                size: Get.width / 18.5,
                                heightsize: Get.height / 18,
                                widthsize: Get.width / 2.8,
                                onPressed: () {},
                                bordercolor: ColorManager.primaryColor,
                                color: ColorManager.primaryColor,
                                txt: 'اعادة الحجز',
                                txtcolor: ColorManager.black,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        if (typebody == 'done')
                          RatingBar.builder(
                            itemSize: Get.width * 0.085,
                            initialRating: appointments[index].completed!,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(Icons.star,
                                color: ColorManager.primaryColor),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: CircleAvatar(
                    radius: Get.width / 8.5,
                    backgroundImage:
                        const AssetImage('assets/images/doctor2.png'),
                  ),
                ),
              ]),
            );
          },
        );
      }
    });
  }
}

class TimeWidget extends StatelessWidget {
  final IconData icon;
  final String txt;
  const TimeWidget({
    super.key,
    required this.icon,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(20),
        Icon(
          icon,
          color: ColorManager.primaryColor,
          size: 20,
        ),
        const Gap(5),
        Text(
          txt,
          style: TextStyle(
            color: ColorManager.black,
            fontSize: Get.width * 0.04,
          ),
        ),
      ],
    );
  }
}
