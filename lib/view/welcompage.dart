import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('assets/images/doctor1.png')),
            Positioned(
              top: Get.height * 0.7,
              child: Container(
                height: Get.height * 0.25,
                width: Get.width * 0.9,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorManager.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ' Consult only with a doctor you trust ',
                      style: TextStyle(
                        fontSize: Get.width * 0.06,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: ColorManager.primaryColor, // button color
                        child: InkWell(
                          splashColor: ColorManager.red, // inkwell color
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.arrow_forward),
                          ),
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
