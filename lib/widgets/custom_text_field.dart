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
          iconColor: ColorManager.lightGrey2,
          fillColor: ColorManager.lightGrey,
          filled: true,
          constraints: const BoxConstraints(maxHeight: 90),
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey2, width: 0.5),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: texthint,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
