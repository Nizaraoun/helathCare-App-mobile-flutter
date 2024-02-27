import 'package:flutter/material.dart';

import '../view/resources/color/color_manager.dart';

class SerchField extends StatelessWidget {
  final TextInputType inputType;
  final double height;
  final String? Function(String?) validator;
  final IconButton icon;
  final String texthint;
  const SerchField(
      {super.key,
      this.height = 90,
      required this.inputType,
      required this.validator,
      required this.icon,
      required this.texthint});

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
          fillColor: Color.fromARGB(255, 243, 244, 247),
          filled: true,
          constraints: BoxConstraints(maxHeight: height),
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
