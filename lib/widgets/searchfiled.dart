import 'package:flutter/material.dart';

import '../view/resources/color/color_manager.dart';

class SerchField extends StatelessWidget {
  final TextInputType inputType;
  final double height;
  final Color color;
  final String? Function(String?) validator;
  final IconButton icon;
  final String texthint;
  const SerchField(
      {super.key,
      this.height = 90,
      required this.inputType,
      required this.validator,
      required this.icon,
      required this.texthint,
      this.color = ColorManager.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 190, 189, 189).withOpacity(0.4),
              spreadRadius: 2,
              blurStyle: BlurStyle.normal,
              blurRadius: 3,
              offset: const Offset(2, 1), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          scrollPhysics: const BouncingScrollPhysics(),
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
            constraints: BoxConstraints(maxHeight: height),
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: texthint,
            hintStyle: TextStyle(
              color: ColorManager.grey,
              fontFamily: 'Tajawal',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: icon,
          ),
        ),
      ),
    );
  }
}
