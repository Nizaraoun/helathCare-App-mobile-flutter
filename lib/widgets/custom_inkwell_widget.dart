import 'package:flutter/material.dart';

class CustomInkWellWidget extends StatelessWidget {
  final void Function()? ontap;
  final Widget widget;
  const CustomInkWellWidget({
    super.key,
    required this.widget,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: widget,
    );
  }
}
