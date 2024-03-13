import 'package:flutter/widgets.dart';

class CustomTextWidget extends StatelessWidget {
  final String Txt;
  final String fontfamily;
  final Color color;
  final double size;
  final FontWeight fontweight;
  final double spacing;
  const CustomTextWidget({
    super.key,
    required this.Txt,
    required this.color,
    required this.size,
    required this.fontweight,
    required this.spacing,
    this.fontfamily = 'Tajawal',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Txt,
      style: TextStyle(
          fontFamily: fontfamily,
          color: color,
          fontSize: size,
          fontWeight: fontweight,
          letterSpacing: spacing),
    );
  }
}
