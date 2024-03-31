import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../view/resources/color/color_manager.dart';
import 'customtext.dart';
import '../../../model/governerat.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<GovernorateData> items;
  final void Function(String?) onchange;
  String? selectedValue;
  CustomDropdownButton({
    super.key,
    this.selectedValue,
    required this.items,
    required this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isDense: true,
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorManager.primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorManager.blueprimaryColor,
          ),
        ),
        counter: const SizedBox.shrink(),
        // fillColor: ColorManager.grey6,
        hoverColor: ColorManager.blue,
        focusColor: ColorManager.blue,

        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // Add more decoration..
      ),
      hint: Text(
        ' اختر الولاية',
        style: TextStyle(fontSize: 14, color: ColorManager.blue),
      ),
      items: items
          .map((e) => e.name)
          .toList()
          .map((items) => DropdownMenuItem<String>(
                alignment: Alignment.topCenter,
                value: items.toString(),
                child: CustomTextWidget(
                  fontfamily: 'Cairo',
                  Txt: items.toString(),
                  size: Get.width / 21,
                  color: ColorManager.black,
                  fontweight: FontWeight.w400,
                  spacing: 0,
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {
        onchange(value);
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 15),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: ColorManager.blue,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: Get.width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
