import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sahtech/controller/home/doctor/reservation_controller.dart';
import 'package:sahtech/view/home/home%20page/doctor_section/widget/skeleton.dart';
import 'package:sahtech/view/resources/color/color_manager.dart';
import 'package:sahtech/view/resources/strings_manager.dart';
import 'package:sahtech/widgets/cusomelvatedbutton.dart';
import '../../../controller/home/home_page/homepagecontorller.dart';
import '../../../controller/home/phamacy/pharmcie_controller.dart';
import '../../../controller/home/profile/image_picker_controller.dart';
import '../../../model/governerat.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/global/show_image.dart';
import '../../../widgets/custom_icone_button.dart';
import '../../../widgets/custom_inkwell_widget.dart';
import '../../../widgets/customlistview.dart';
import '../../../widgets/customtext.dart';
import '../../../widgets/searchfiled.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color/constant.dart';
import '../../resources/size_config.dart';
import '../menu/appointment/doctor_screen/doctor_profile.dart';
import 'doctor_section/widget/CustomDocotrDetails.dart';
import 'widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    HomePageControllerimp controller = Get.put(HomePageControllerimp());
    ReservationControllerImp reservationController =
        Get.put(ReservationControllerImp());
    PharmacyLocationsimp locationcontroller = Get.put(PharmacyLocationsimp());
    ImageControllerImp controllerimg = Get.put(ImageControllerImp());

    return Scaffold(
      // Assign the key to the Scaffold
      key: scaffoldKey,
      drawer: const CustomDrawerWidget(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFfdfbfb),
                  Color(0xFFebedee),
                ],
                stops: [0.0, 1.0],
                transform: GradientRotation(120 * (3.141592653589793 / 180)),
              ),
            ),
          )),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 0)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the 5 seconds, display the Lottie animation
            return Center(
              child: Lottie.asset(
                'assets/images/loding.json', // loading animation lottie
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            );
          } else {
            // After some seconds, display the container
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFfdfbfb), // #fdfbfb
                    Color(0xFFebedee), // #ebedee
                  ],
                  stops: [0.0, 1.0],
                  transform: GradientRotation(120 * (3.141592653589793 / 180)),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textDirection: TextDirection.rtl,
                        children: [
                          Obx(() {
                            if (controllerimg.image.value == null) {
                              return CircleAvatar(
                                radius: Get.width / 16,
                                backgroundImage: const AssetImage(
                                    "assets/images/userimage.png"),
                              );
                            } else {
                              return CustomProfieImage(
                                redius: Get.width / 16,
                                controller: controllerimg,
                              );
                            }
                          }),
                          Gap(Get.width / 30),
                          CustomIconButton(
                            icon: const Icon(FontAwesomeIcons.bell),
                            onPressed: () {},
                            color: ColorManager.primaryColor,
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            tooltip: "الاشعارات",
                            iconSize: Get.width / 18,
                            alignment: Alignment.centerLeft,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            autofocus: true,
                          ),
                          Gap(Get.width / 45),
                          CustomIconButton(
                            icon:
                                const Icon(FontAwesomeIcons.facebookMessenger),
                            onPressed: () {
                              AppRoutes().goTo(AppRoutes.conversation);
                            },
                            color: ColorManager.blueprimaryColor,
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            tooltip: "الاشعارات",
                            iconSize: Get.width / 18,
                            alignment: Alignment.centerLeft,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            autofocus: true,
                          ),
                          const Spacer(),
                          CustomIconButton(
                            icon: const Icon(Icons.menu_rounded),
                            onPressed: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            color: ColorManager.blackLight,
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                ColorManager.lightGrey2,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            tooltip: "الاشعارات",
                            iconSize: Get.width / 12,
                            alignment: Alignment.centerLeft,
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            autofocus: true,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height / 35),
                        child: CustomTextWidget(
                          fontfamily: 'Cario',
                          Txt:
                              "\ud83d\udc4b ${controller.userName.substring(0, controller.userName.indexOf(" "))} مرحبا ",
                          size: Get.width / 14,
                          color: ColorManager.blackLight,
                          fontweight: FontWeight.w600,
                          spacing: 0,
                        ),
                      ),
                      Gap(Get.height / 38),
                      SizedBox(
                        height: Get.height / 11.5,
                        child: SerchField(
                          height: Get.height / 11.5,
                          icon: IconButton(
                            icon: const Icon(Icons.search_rounded),
                            onPressed: () {},
                          ),
                          texthint: "اطباء ,  بحث",
                          inputType: TextInputType.text,
                          validator: (value) {
                            return null;

                            // if (value!.isEmpty) {
                            //   return "الرجاء ادخال البيانات";
                            // }
                          },
                        ),
                      ),
                      Gap(Get.height / 20),
                      SizedBox(
                        height: Get.height / 5,
                        width: Get.width,
                        child: CustomListView(
                          reverse: true,
                          direction: Axis.horizontal,
                          count: 5,
                          itemBuilder: (index) {
                            return GestureDetector(
                                onTap: () async {
                                  if (AppRoutes()
                                          .serviceRouting[index]
                                          .toString() ==
                                      '/pharmacy') {
                                    locationcontroller.pharmacyNames.clear();
                                    locationcontroller.rating.clear();
                                    locationcontroller.vicinity.clear();
                                    locationcontroller.getCurrentLocation();
                                    locationcontroller.governoratesData
                                        .assignAll(
                                            GovernorateData.allGovernorates);
                                  }
                                  AppRoutes().goTo(AppRoutes()
                                      .serviceRouting[index]
                                      .toString());
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "$imagePath${Serviceassets().serviceassets[index]}.png",
                                      width: Get.width / 5,
                                      height: Get.height / 13,
                                    ),
                                    const Gap(10),
                                    CustomTextWidget(
                                      Txt: StringsManager().servicelist[index],
                                      size: Get.width / 17,
                                      color: ColorManager.grey2,
                                      fontweight: FontWeight.w500,
                                      spacing: 0,
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 5,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 101, 129, 184),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: ColorManager.grey,
                                  width: 1,
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    width: Get.width,
                                    "assets/images/card_bg.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/doctor2.png",
                                      ),
                                      const Gap(30),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              fontfamily: 'Cario',
                                              Txt: "دكتورة سارة احمد",
                                              size: Get.width / 19,
                                              color: ColorManager.white,
                                              fontweight: FontWeight.w900,
                                              spacing: 0,
                                            ),
                                            Gap(Get.height / 50),
                                            CustomTextWidget(
                                              Txt: "اخصائي جراحة القلب",
                                              size: Get.width / 22,
                                              color: ColorManager.white70,
                                              fontweight: FontWeight.w400,
                                              spacing: 0,
                                            ),
                                            const Spacer(),
                                            CustomElevatedButton(
                                              size: Get.width / 23,
                                              widthsize: Get.width / 3,
                                              heightsize: Get.height / 20,
                                              txt: "حجز موعد",
                                              onPressed: () {},
                                              color: ColorManager.primaryColor,
                                              txtcolor: ColorManager.white,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 10,
                          itemWidth: Get.width * 0.85,
                          layout: SwiperLayout.STACK,
                        ),
                      ),
                      Gap(Get.height / 20),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          CustomTextWidget(
                            Txt: "أفضل الأطباء",
                            size: Get.width / 20,
                            color: ColorManager.blackLight,
                            fontweight: FontWeight.w900,
                            spacing: 0,
                          ),
                          const Spacer(),
                          CustomInkWellWidget(
                            ontap: () async {
                              controller.image.value = null;
                              AppRoutes().goTo(
                                AppRoutes.topdoctor,
                              );
                            },
                            widget: CustomTextWidget(
                              Txt: "عرض المزيد",
                              size: Get.width / 19,
                              color: ColorManager.primaryColor,
                              fontweight: FontWeight.w400,
                              spacing: 0,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        width: Get.width * 0.9,
                        height: Get.height / 3.5,
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                width: Get.width / 2.5,
                                height: Get.height / 3.5,
                                decoration: BoxDecoration(
                                  color: ColorManager.lightGrey,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: ColorManager.lightGrey2,
                                      width: 1.5),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: defaultPadding),
                            );
                          } else {
                            return CustomListView(
                                reverse: true,
                                direction: Axis.horizontal,
                                count: controller.doctorDto.length ~/ 3.5,
                                itemBuilder: (index) {
                                  List<int> decodedBytes = base64.decode(
                                      controller.doctorDto[index].image!);
                                  String originalString =
                                      utf8.decode(decodedBytes);
                                  ShowImage().loadImage(originalString);
                                  return Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    width: Get.width / 2.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: ColorManager.lightGrey2,
                                          width: 1.5),
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(DoctorProfile(
                                            index: index,
                                          ));
                                          reservationController.idPraticien =
                                              controller.doctorDto[index].id ??
                                                  "0";
                                        },
                                        child: Column(children: [
                                          Container(
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              height: Get.height / 9.7,
                                              width: Get.width / 4.6,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      ColorManager.grey5,
                                                  backgroundImage: controller
                                                          .image.value?.image ??
                                                      const AssetImage(
                                                          "assets/images/userimage.png"))),
                                          //*********** DOCOTR DETAILS********
                                          DoctorDetails(
                                            controller: controller,
                                            index: index,
                                            doctorname: SizeUtil().inputText(
                                              controller
                                                      .doctorDto[index].name ??
                                                  " ",
                                              Get.width / 2.5,
                                              TextStyle(
                                                  fontSize: Get.width / 20),
                                            ),
                                            namesize: Get.width / 20,
                                            fontweightname: FontWeight.w500,
                                            specialitytextsiz: Get.width / 25,
                                            specialityweight: FontWeight.w400,
                                            spacing: Get.height * 0.01,
                                            fontsizerating: TextStyle(
                                                fontSize: Get.width / 25),
                                            sizerating: Get.width / 25,
                                            fontweightrating: FontWeight.w400,
                                            iconsizerating: Get.width / 25,
                                          ),
                                        ])),
                                  );
                                });
                          }
                        }),
                      ),
                      Gap(Get.height / 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 15),
                        height: Get.height / 5.8,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ColorManager.white2,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CustomIconButton(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.paperPlane),
                                color: ColorManager.greenbtn2,
                                iconSize: Get.width / 12,
                                alignment: Alignment.center,
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(Get.width / 8, Get.height / 16.2)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorManager.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: ColorManager.white3, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ),
                                ),
                                visualDensity: const VisualDensity(
                                    horizontal: 0, vertical: -4),
                                autofocus: true,
                              ),
                              title: CustomTextWidget(
                                Txt: "الاستشارات الطبية",
                                size: Get.width / 25,
                                color: ColorManager.black,
                                fontweight: FontWeight.w900,
                                spacing: 0,
                              ),
                              subtitle: CustomTextWidget(
                                Txt: "اطرح سؤالك واحصل على الاجابة",
                                size: Get.width / 30,
                                color: ColorManager.grey,
                                fontweight: FontWeight.w400,
                                spacing: 0,
                              ),
                            ),
                            const Gap(10),
                            SizedBox(
                              width: Get.width / 2,
                              height: Get.height / 25,
                              child: CustomElevatedButton(
                                size: Get.width / 23,
                                widthsize: Get.width / 3,
                                heightsize: Get.height / 20,
                                txt: "اطرح سؤالك",
                                onPressed: () {
                                  AppRoutes().goTo(AppRoutes.feedsScreen);
                                },
                                color: ColorManager.primaryColor,
                                txtcolor: ColorManager.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            );
          }
        },
      ),
    );
  }
}
