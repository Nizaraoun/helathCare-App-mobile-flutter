import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../resources/color/color_manager.dart';
import 'constant.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius:
              const BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({super.key, this.size = 24});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding:
              EdgeInsets.only(left: defaultPadding, right: defaultPadding / 2),
          child: Skeleton(height: 120, width: 120),
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: Get.width / 2),
              const SizedBox(height: defaultPadding / 2),
              Skeleton(width: Get.width / 4),
              const SizedBox(height: defaultPadding),
              Skeleton(width: Get.width / 7),
              const SizedBox(height: defaultPadding / 2),
              Skeleton(width: Get.width / 4),
            ],
          ),
        )
      ],
    );
  }
}
