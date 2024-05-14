// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import for setting locale
import 'package:sahtech/view/resources/color/color_manager.dart';
import '../../../../../../widgets/customlistview.dart';

class JourWidget extends StatefulWidget {
  const JourWidget({super.key});

  @override
  _JourWidgetState createState() => _JourWidgetState();
}

class _JourWidgetState extends State<JourWidget> {
  int _selectedIndex = -1; // Initially no container is selected
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _initializeDates();
  }

  void _initializeDates() {
    initializeDateFormatting(
        'ar'); // Initialize date formatting for Arabic locale
    _dates = _generateDates();
  }

  List<DateTime> _generateDates() {
    List<DateTime> dates = [];
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 16; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SizedBox(
          width: Get.width * 0.9,
          height: Get.height * 0.08,
          child: CustomListView(
            reverse: true,
            direction: Axis.horizontal,
            count: 15,
            itemBuilder: (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle selection by comparing the current index with the selected index
                    _selectedIndex = _selectedIndex == index ? -1 : index;
                  });
                },
                child: Container(
                  width: Get.width * 0.12,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Colors.blue
                        : ColorManager.white1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEEE', 'ar')
                            .format(_dates[index]), // Set locale to Arabic
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : ColorManager.black,
                          fontSize: Get.width * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat('dd MMM', 'ar')
                            .format(_dates[index]), // Set locale to Arabic
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : ColorManager.black,
                          fontSize: Get.width * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
