import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/Appointment.dart';
import '../../../service/home/appointment_service.dart';

abstract class AppointmentController extends GetxController {
  RxList<Appointments> appointmentsUpcoming = <Appointments>[].obs;
  RxList<Appointments> appointmentsCanceled = <Appointments>[].obs;
  RxList<Appointments> appointmentsCompleted = <Appointments>[].obs;

  getAppointmentList();
  @override
  void onInit() {
    getAppointmentList();
    super.onInit();
  }
}

class AppointmentControllerImp extends AppointmentController {
  @override
  void getAppointmentList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id')!;
    final response = await AppointmentService().getAppointmentList(id);
    for (var i = 0; i < response.length; i++) {
      appointmentsUpcoming.addIf(
          response[i].cancel == false && response[i].completed! < 1,
          response[i]);
      appointmentsCanceled.addIf(response[i].cancel == true, response[i]);
      appointmentsCompleted.addIf(response[i].completed! > 0, response[i]);
    }
  }

  void cancelAppointment(int id) async {
    await AppointmentService().cancelAppointment(id);
    appointmentsCanceled.add(
      appointmentsUpcoming.firstWhere(
        (element) => element.id == id,
      ),
    );
    appointmentsUpcoming.removeWhere(
      (element) => element.id == id,
    );
  }
}
