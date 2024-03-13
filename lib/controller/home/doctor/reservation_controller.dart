import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../service/home/free_reservation.dart';

abstract class ReservationController extends GetxController {
  RxList<DateTime> dates = <DateTime>[].obs;
  RxInt selectedIndex = 0.obs;
  DateTime selectedDate = DateTime.now();

  int idPraticien = 0;

  RxList<bool> buttonStates = <bool>[].obs;
  RxList<String> timeSlots = <String>[].obs;

  void generateTimeSlots(DateTime selectedDate, int idPraticien);
  void _initializeDates();
  bool _isSameDay(DateTime date1, DateTime date2);
  void onButtonPressed(int index);
  List<DateTime> generateDates();

  @override
  void onInit() {
    _initializeDates();
    selectedDate = DateTime.now();
    generateTimeSlots(selectedDate, idPraticien);
    super.onInit();
  }
}

class ReservationControllerImp extends ReservationController {
  @override
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  void _initializeDates() {
    initializeDateFormatting(
        'ar'); // Initialize date formatting for Arabic locale
    dates.assignAll(generateDates());
  }

  @override
  List<DateTime> generateDates() {
    List<DateTime> datesList = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 16; i++) {
      datesList.add(currentDate.add(Duration(days: i)));
    }
    return datesList;
  }

  @override
  void generateTimeSlots(DateTime selectedDate, int idPraticien) async {
    timeSlots.clear();
    DateTime startTime =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 8, 0);
    DateTime endTime = DateTime(
        selectedDate.year, selectedDate.month, selectedDate.day, 17, 0);

    while (startTime.isBefore(endTime)) {
      timeSlots.add(
          '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}');
      startTime =
          startTime.add(const Duration(hours: 1)); // Increment by 1 hour
      // Truncate minutes part to 0
      startTime = DateTime(
          startTime.year, startTime.month, startTime.day, startTime.hour);
    }
    // Get reserved hours for the selected doctor on the selected day
    ReservationService().getReservedHoursForDoctorOnDay(
        idPraticien: idPraticien, jour: selectedDate.toString().split(' ')[0]);
    // Check if the time slot is in the past and mark it as unavailable if so (for today's date only)
    for (int i = 0; i < timeSlots.length; i++) {
      if (_isSameDay(selectedDate, DateTime.now())) {
        if (DateTime.now().hour > int.parse(timeSlots[i].split(':')[0])) {
          timeSlots[i] = 'غير متاح';
        }
      }
    }

    // Initialize button states based on the number of time slots
    buttonStates.assignAll(List.generate(
        timeSlots.length, (index) => timeSlots[index] != 'غير متاح'));
  }

  @override
  void onButtonPressed(int index) {
    timeSlots[index] = 'Booked';
    print('Button $index pressed');
    buttonStates[index] = !buttonStates[index];
  }
}
