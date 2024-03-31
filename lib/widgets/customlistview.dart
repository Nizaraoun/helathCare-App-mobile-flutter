import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomListView extends StatelessWidget {
  final int count;
  final bool reverse;
  final Widget Function(int) itemBuilder;
  final Axis direction;

  const CustomListView({
    super.key,
    required this.itemBuilder,
    required this.count,
    required this.direction,
    required this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      reverse: reverse,
      scrollDirection: direction,
      separatorBuilder: (context, i) => Gap(Get.width / 18),
      itemCount: count,
      itemBuilder: (context, j) {
        return itemBuilder(j);
      },
    );
  }
}
