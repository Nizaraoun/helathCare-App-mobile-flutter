import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.w100,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          count > 0
              ? Container(
                  margin: const EdgeInsetsDirectional.only(start: 8),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: ColorManager.pink,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      count > 9 ? "9+" : count.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
