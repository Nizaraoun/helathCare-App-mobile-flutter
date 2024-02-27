import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
  final int count;
  final Widget Function(int) itemBuilder;

  const CustomListView({
    super.key,
    required this.itemBuilder,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, i) => Gap(Get.width / 18),
      itemCount: count,
      itemBuilder: (context, j) {
        return itemBuilder(j);
      },
    );
  }
}
