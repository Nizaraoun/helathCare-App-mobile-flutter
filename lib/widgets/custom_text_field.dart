import 'dart:ui';
import 'package:flutter/material.dart';
import '../view/resources/color/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final String? Function(String?) validator;
  final Icon icon;
  final String texthint;
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.texthint,
      required this.inputType,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurStyle: BlurStyle.normal,
              blurRadius: 8,
              offset: const Offset(2, 1), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          textAlign: TextAlign.right,
          keyboardType: inputType,
          strutStyle: const StrutStyle(height: 1.5),
          keyboardAppearance: Brightness.dark,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          validator: validator,
          decoration: InputDecoration(
            iconColor: ColorManager.black,
            fillColor: ColorManager.white,
            filled: true,
            constraints: const BoxConstraints(maxHeight: 90),
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.blue, width: 2.0),
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: texthint,
            prefixIcon: icon,
          ),
        ),
      ),
    );
  }
}
