import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/widgets/customtext.dart';

import '../utils/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(image: AssetImage('assets/images/doctor1.png')),
            Positioned(
              top: Get.height * 0.7,
              child: Container(
                height: Get.height * 0.25,
                width: Get.width * 0.9,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: ColorManager.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      Txt:
                          'طبيبك هو شريكك في الرعاية الصحية\n. يجب عليك البحث عن طبيب تثق به تمامًا\n، فهو الذي سيساعدك في فهم حالتك الصحية واختيار العلاج المناسب بالنسبة لك.',
                      size: 20,
                      color: ColorManager.black,
                      spacing: 0,
                      fontfamily: 'Cairo',
                      fontweight: FontWeight.bold,
                    ),
                    const Spacer(),
                    ClipOval(
                      child: Material(
                        color: ColorManager.primaryColor, // button color
                        child: InkWell(
                          splashColor: ColorManager.red, // inkwell color
                          child: const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.arrow_forward),
                          ),
                          onTap: () {
                            AppRoutes().goToEnd(AppRoutes.onboarding);
                          },
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
