import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for setting locale
import 'package:sahtech/view/resources/color/color_manager.dart';
import '../../../../widgets/customlistview.dart';
import '../../../controller/home/doctor/reservation_controller.dart';
import '../../../widgets/Dvider.dart';
import '../../resources/assets_manager.dart';

class RendVous extends StatelessWidget {
  RendVous({
    super.key,
  });

  ReservationControllerImp controller = Get.put(ReservationControllerImp());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
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
                            ? Colors.blue
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
                            DateFormat('dd MMM', 'ar')
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
              "assets/images/clander.png",
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
                  onHover: (value) {
                    print(value);
                  },
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.white,
                    animationDuration: const Duration(seconds: 2),
                    fixedSize: Size(Get.width * 0.3, Get.height * 0.061),
                    foregroundColor: Colors.black,
                    backgroundColor: controller.buttonStates[index]
                        ? ColorManager.primaryColor
                        : const Color.fromARGB(255, 217, 29, 29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text(controller.timeSlots[index]),
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
