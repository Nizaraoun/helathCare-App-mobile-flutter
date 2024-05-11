import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/home/menu/appointment/widget/custom_cancelled.dart';
import 'package:sahtech/view/home/menu/appointment/widget/custom_completed.dart';
import 'package:sahtech/view/home/menu/appointment/widget/custom_upcoming.dart';
import 'package:sahtech/view/home/menu/appointment/widget/tabbaritems.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../controller/home/doctor/Appointment_controller.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp appointmencontroller =
        Get.put(AppointmentControllerImp());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeftLong,
              color: ColorManager.black,
              size: Get.width * 0.06,
            ),
            onPressed: () {
              AppRoutes().goToEnd(AppRoutes.home);
            },
          ),
          title: CustomTextWidget(
            Txt: 'المواعيد',
            color: ColorManager.black,
            fontweight: FontWeight.bold,
            spacing: 0.0,
            fontfamily: 'Cairo',
            size: Get.width * 0.06,
          ),
          centerTitle: true,
          backgroundColor: ColorManager.Clouds1,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.09),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: Get.height * 0.07,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorManager.lightGrey2,
                ),
                child: Obx(
                  () => TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        ColorManager.purple1,
                        ColorManager.purple2,
                        ColorManager.purple3,
                      ]),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      TabItem(
                          title: 'القادمة',
                          count:
                              appointmencontroller.appointmentsUpcoming.length),
                      TabItem(
                          title: 'المنجزة',
                          count: appointmencontroller
                              .appointmentsCompleted.length),
                      TabItem(
                          title: 'الملغات',
                          count:
                              appointmencontroller.appointmentsCanceled.length),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          width: Get.width,
          height: Get.height,
          color: ColorManager.Clouds1,
          child: TabBarView(
            children: [
              UpComingAppointment(
                appointments: appointmencontroller.appointmentsUpcoming,
              ),
              CompletedAppointment(
                appointments: appointmencontroller.appointmentsCompleted,
              ),
              CancelledAppointment(
                appointments: appointmencontroller.appointmentsCanceled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
