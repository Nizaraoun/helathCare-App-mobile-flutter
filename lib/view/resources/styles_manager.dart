import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color? color, List<Shadow>? shadows,
    {bool isUnderline = false}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    shadows: shadows,
  );
}

// regular style

TextStyle getRegularStyle(
    {double? fontSize,
    Color? color,
    List<Shadow>? shadows,
    bool isUnderline = false}) {
  fontSize = fontSize ?? FontSize.s12;
  return _getTextStyle(fontSize, FontWeightManager.regular, color, shadows,
      isUnderline: isUnderline);
}

// medium style

TextStyle getMediumStyle(
    {double? fontSize,
    Color? color,
    List<Shadow>? shadows,
    bool isUnderline = false}) {
  fontSize = fontSize ?? FontSize.s12;
  return _getTextStyle(fontSize, FontWeightManager.medium, color, shadows,
      isUnderline: isUnderline);
}

TextStyle getLightStyle(
    {double? fontSize,
    Color? color,
    List<Shadow>? shadows,
    bool isUnderline = false}) {
  fontSize = fontSize ?? FontSize.s12;
  return _getTextStyle(fontSize, FontWeightManager.light, color, shadows,
      isUnderline: isUnderline);
}

TextStyle getBoldStyle(
    {double? fontSize,
    Color? color,
    List<Shadow>? shadows,
    bool isUnderline = false}) {
  fontSize = fontSize ?? FontSize.s12;
  return _getTextStyle(fontSize, FontWeightManager.bold, color, shadows,
      isUnderline: isUnderline);
}

TextStyle getSemiBoldStyle(
    {double? fontSize,
    Color? color,
    List<Shadow>? shadows,
    bool isUnderline = false}) {
  fontSize = fontSize ?? FontSize.s12;
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    shadows,
    isUnderline: isUnderline,
  );
}
