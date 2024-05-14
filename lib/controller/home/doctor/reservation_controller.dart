import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../service/home/reservation_service.dart';

abstract class ReservationController extends GetxController {
  RxList<DateTime> dates = <DateTime>[].obs;

  RxInt selectedIndex = 0.obs;
  DateTime selectedDate = DateTime.now();

  String idPraticien = "0";
  int? index;

  RxList<bool> buttonStates = <bool>[].obs;
  RxList<String> timeSlots = <String>[].obs;
  RxList<int> reservation = <int>[].obs;
  bool isButtonEnabled = false;
  void generateTimeSlots(DateTime selectedDate, String idPraticien);
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
  // Get reserved hours for the selected doctor on the selected day

  Future<void> _fetchReservedHours() async {
    final response = await ReservationService().getReservedHoursForDoctorOnDay(
      idPraticien: idPraticien,
      jour: selectedDate.toString().split(' ')[0],
    );
    for (int i = 0; i < timeSlots.length; i++) {
      if (response.reservedHours.contains(timeSlots[i])) {
        timeSlots[i] = 'غير متاح';
      }
      if (_isSameDay(selectedDate, DateTime.now())) {
        if (DateTime.now().hour > int.parse(timeSlots[i].split(':')[0])) {
          timeSlots[i] = 'غير متاح';
        }
      }
    }
  }

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

// Generate 15 dates starting from today, excluding Sundays
  @override
  List<DateTime> generateDates() {
    List<DateTime> datesList = [];
    DateTime currentDate = DateTime.now();

    for (int i = 0; datesList.length < 16; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));
      if (nextDate.weekday != DateTime.sunday) {
        datesList.add(nextDate);
      }
    }

    return datesList;
  }

  @override
  void generateTimeSlots(DateTime selectedDate, String idPraticien) async {
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
    // Get reserved hours
    await _fetchReservedHours();

    // Initialize button states based on the number of time slots
    buttonStates.assignAll(List.generate(
        timeSlots.length, (index) => timeSlots[index] != 'غير متاح'));
  }

// When a time slot is pressed, it is added to the reservation list and its state is toggled
  @override
  void onButtonPressed(int index) {
    if (reservation.isEmpty) {
      timeSlots[index] = timeSlots[index];
      buttonStates[index] = !buttonStates[index];
      reservation.add(index);
    } else {
      int ch = reservation[0];;
      buttonStates[ch] = !buttonStates[ch];
      buttonStates[index] = !buttonStates[index];
      reservation.clear();
      reservation.add(index);
      timeSlots[index] = timeSlots[index];
    }
  }
}
