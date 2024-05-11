import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../../controller/home/doctor/Appointment_controller.dart';
import '../../../../../model/Appointment.dart';
import 'appointmentbody.dart';

class CompletedAppointment extends StatelessWidget {
  final RxList<Appointments> appointments;

  const CompletedAppointment({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp appointmencontroller =
        Get.put(AppointmentControllerImp());
    return AppointmentBody(
        appointmencontroller: appointmencontroller,
        appointments: appointments,
        typebody: 'done');
  }
}
