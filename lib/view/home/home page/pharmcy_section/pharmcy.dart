import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/utils/app_routes.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import '../../../../controller/home/phamacy/pharmcie_controller.dart';
import '../../../../model/geolocation.dart';
import '../../../../widgets/dropdown.dart';
import '../../../../widgets/customtext.dart';
import '../../../resources/size_config.dart';
import '../doctor_section/widget/Skeleton.dart';
import '../doctor_section/widget/constant.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PharmacyLocationsimp controller = Get.put(PharmacyLocationsimp());

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,

            excludeHeaderSemantics: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
            backgroundColor: ColorManager
                .primaryColor, // Make sure primaryColor is a Color instance
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Get.height / 13),
              child: SizedBox(
                width: Get.width,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    Obx(() {
                      return SizedBox(
                          width: Get.width / 2,
                          child: CustomDropdownButton(
                            onchange: (value) {
                              controller.marker.clear();
                              controller.pharmacyNames.clear();
                              controller.rating.clear();
                              controller.vicinity.clear();
                              controller.selectedvalue = value.toString();
                              controller.fetchPharmacy(
                                controller
                                    .governoratesData[controller
                                        .governoratesData
                                        .indexWhere((element) =>
                                            element.name == value.toString())]
                                    .lat,
                                controller
                                    .governoratesData[controller
                                        .governoratesData
                                        .indexWhere((element) =>
                                            element.name == value.toString())]
                                    .lng,
                              );
                            },
                            items: controller.governoratesData.toList(),
                            selectedValue: controller.selectedvalue.toString(),
                          ));
                    }),
                  ],
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.asset(
                'assets/images/womampharmacy.jpg',
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return SliverFillRemaining(
                  child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
              ));
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () async {
                          LocationModel(
                            latitude: 33.8820,
                            longitude: 10.0952,
                          );
                          AppRoutes().goTo(AppRoutes.maplocation);
                        },
                        child: Card(
                          color: ColorManager.white,
                          elevation: 3,
                          borderOnForeground: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(Get.width * 0.02),
                                  width: Get.width,
                                  height: Get.height / 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        children: [
                                          Image.asset(
                                            'assets/images/pharmacy.png',
                                            width: Get.width * 0.08,
                                          ),
                                          CustomTextWidget(
                                              Txt: SizeUtil().inputText(
                                                controller.pharmacyNames[
                                                            index] ==
                                                        0
                                                    ? "--"
                                                    : controller
                                                        .pharmacyNames[index]
                                                        .toString(),
                                                Get.width * 0.9,
                                                TextStyle(
                                                    fontSize: Get.width / 20),
                                              ),
                                              color: ColorManager.darkBlue,
                                              size: Get.width * 0.04,
                                              fontweight: FontWeight.w500,
                                              spacing: 0),
                                        ],
                                      ),
                                      Gap(Get.width * 0.03),
                                      Wrap(
                                        children: [
                                          const Icon(
                                            Icons.sunny,
                                            color: ColorManager.amber,
                                          ),
                                          CustomTextWidget(
                                            fontfamily: 'Cairo',
                                            Txt: "مفتوح",
                                            size: Get.width / 25,
                                            color: ColorManager.darkestBlue,
                                            fontweight: FontWeight.w400,
                                            spacing: 0,
                                          ),
                                        ],
                                      ),
                                      Gap(Get.width * 0.03),
                                      Wrap(
                                        children: [
                                          const Icon(
                                            Icons.location_on_sharp,
                                            color: ColorManager.primaryColor,
                                          ),
                                          CustomTextWidget(
                                            fontfamily: 'Cairo',
                                            Txt: SizeUtil().inputText(
                                              controller.vicinity[index] == 0
                                                  ? "--"
                                                  : controller.vicinity[index]
                                                      .toString(),
                                              Get.width,
                                              TextStyle(
                                                  fontSize: Get.width / 20),
                                            ),
                                            size: Get.width / 25,
                                            color: ColorManager.darkestBlue,
                                            fontweight: FontWeight.w400,
                                            spacing: 0,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: SizeUtil().calculateTextWidth(
                                                controller.rating[index]
                                                    .toString(),
                                                TextStyle(
                                                    fontSize: Get.width / 25)) +
                                            Get.width / 25,
                                        decoration: BoxDecoration(
                                          color: ColorManager.greenrate,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: Get.width / 25,
                                              color: ColorManager.primaryColor,
                                            ),
                                            CustomTextWidget(
                                              fontfamily: 'Cairo',
                                              Txt: controller.rating[index] == 0
                                                  ? "--"
                                                  : controller.rating[index]
                                                      .toString(),
                                              size: Get.width / 25,
                                              color: ColorManager.primaryColor,
                                              fontweight: FontWeight.w400,
                                              spacing: 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: controller.pharmacyNames.length,
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
