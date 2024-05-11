import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../widgets/customlistview.dart';
import '../../../controller/home/doctor/reservation_controller.dart';

class RendVous extends StatelessWidget {
  const RendVous({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ReservationControllerImp controller = Get.put(ReservationControllerImp());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.02),
          child: SizedBox(
            width: Get.width * 0.9,
            height: Get.height * 0.08,
            child: CustomListView(
              reverse: true,
              direction: Axis.horizontal,
              count: 15,
              itemBuilder: (index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = index;
                      controller.selectedDate = controller.dates[index];
                      controller.generateTimeSlots(
                          controller.selectedDate, controller.idPraticien);
                    },
                    child: Container(
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: controller.selectedIndex.value == index
                            ? ColorManager.primaryColor
                            : ColorManager.white1,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEEE', 'ar')
                                .format(controller.dates[index]),
                            style: TextStyle(
                              color: controller.selectedIndex.value == index
                                  ? Colors.white
                                  : ColorManager.black,
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            DateFormat('dd MMM', 'fr')
                                .format(controller.dates[index]),
                            style: TextStyle(
                              color: controller.selectedIndex.value == index
                                  ? Colors.white
                                  : ColorManager.black,
                              fontSize: Get.width * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Gap(Get.height * 0.04),
        Divider(
          height: Get.height * 0.03,
          thickness: Get.width * 0.002,
          indent: Get.width * 0.03,
          endIndent: Get.width * 0.03,
          color: ColorManager.lightGrey,
        ),
        Gap(Get.height * 0.04),
        Obx(() {
          if (controller.timeSlots.isEmpty) {
            return Image.asset(
              filterQuality: FilterQuality.high,
              "assets/images/calendar.png",
              width: Get.width * 0.7,
              height: Get.height * 0.4,
            );
          } else {
            return Wrap(
              spacing: Get.height * 0.02,
              runSpacing: 8.0,
              children: List.generate(
                  controller.timeSlots.length,
                  (index) => ElevatedButton(
                        onPressed: controller.buttonStates[index]
                            ? () => controller.onButtonPressed(index)
                            : null,
                        onHover: (value) {},
                        style: ElevatedButton.styleFrom(
                          surfaceTintColor: ColorManager.black,
                          animationDuration: const Duration(seconds: 1),
                          fixedSize: Size(Get.width * 0.3, Get.height * 0.061),
                          foregroundColor: ColorManager.black,
                          backgroundColor: controller.buttonStates[index]
                              ? ColorManager.primaryColor
                              : ColorManager.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(
                                color: ColorManager.primaryColor),
                          ),
                        ),
                        child: CustomTextWidget(
                          spacing: 0,
                          fontfamily: 'Tajawal',
                          Txt: controller.timeSlots[index],
                          color: controller.buttonStates[index]
                              ? ColorManager.black
                              : ColorManager.grey,
                          size: Get.width * 0.04,
                          fontweight: FontWeight.bold,
                        ),
                      )),
            );
          }
        }),
      ],
    );
  }
}
