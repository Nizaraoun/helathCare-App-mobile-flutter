import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/home/menu/appointment/widget/appointmentbody.dart';
import '../../../../../controller/home/doctor/Appointment_controller.dart';
import '../../../../../model/Appointment.dart';

class UpComingAppointment extends StatelessWidget {
  final RxList<Appointments> appointments;
  const UpComingAppointment({super.key, required, required this.appointments});
  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp appointmencontroller =
        Get.put(AppointmentControllerImp());

    return AppointmentBody(
      appointmencontroller: appointmencontroller,
      appointments: appointments,
      typebody: 'upcoming',
    );
  }
}
