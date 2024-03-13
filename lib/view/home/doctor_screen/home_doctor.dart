import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/doctor/reservation_controller.dart';
import 'rende_vous.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({super.key});

  ReservationControllerImp controller = Get.put(ReservationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 90,
      ),
      child: Column(children: [
        RendVous(),
      ]),
    ));
  }
}
