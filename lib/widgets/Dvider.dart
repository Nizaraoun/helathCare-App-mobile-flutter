import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/resources/color/color_manager.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        height: Get.height * 0.03,
        thickness: Get.width * 0.002,
        indent: Get.width * 0.03,
        endIndent: Get.width * 0.03,
        color: ColorManager.grey,
      ),
    );
  }
}
