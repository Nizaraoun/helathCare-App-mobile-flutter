import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';

import '../../../controller/home/doctor/reservation_controller.dart';
import 'rende_vous.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({
    super.key,
  });

  ReservationControllerImp reservationController =
      Get.put(ReservationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 90,
      ),
      child: Column(children: [
        //Get rendevous widget with the idPraticien
        CustomElevatedButton(
          heightsize: 50,
          widthsize: 200,
          size: 20,
          txt: 'Rendez-vous',
          onPressed: () {
            print(reservationController.idPraticien);
          },
        ),
        RendVous(),
      ]),
    ));
  }
}
