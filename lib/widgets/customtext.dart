import 'package:flutter/widgets.dart';

class CustomTextWidget extends StatelessWidget {
  final String Txt;
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
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Txt,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontweight,
          letterSpacing: spacing),
    );
  }
}
