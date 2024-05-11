import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sahtech/controller/home/feed/feed_controller.dart';
import 'package:sahtech/view/home/home%20page/feed/widget/widgetbutton.dart';
import 'package:sahtech/widgets/custom_icone_button.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../resources/color/color_manager.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FeedController feedController = Get.put(FeedControllerImp());
    return Scaffold(
        floatingActionButton: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SpeedDial(
              curve: Curves.easeInOutCirc,
              icon: FontAwesomeIcons.sliders,
              foregroundColor: ColorManager.white,
              buttonSize: const Size(55, 54),
              activeIcon: Icons.close,

              activeBackgroundColor: ColorManager.grey3,
              // animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: const IconThemeData(size: 22.0),
              backgroundColor: ColorManager.lightPrimary,
              children: [
                SpeedDialChild(
                  child: const Icon(FontAwesomeIcons.userFriends),
                  backgroundColor: ColorManager.greenbtn2,
                  label: 'المتابعات',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () async {},
                ),
                SpeedDialChild(
                  child: const Icon(FontAwesomeIcons.feed),
                  backgroundColor: ColorManager.greenbtn2,
                  label: 'كل لاخبار',
                  labelStyle: const TextStyle(fontSize: 18.0),
                  onTap: () async {},
                ),
              ],
            ),
            Obx(
              () => AnimatedContainer(
                margin: const EdgeInsets.only(left: 30),
                duration: const Duration(milliseconds: 700),
                alignment: Alignment.topRight,
                height: feedController.height.value,
                width: Get.width,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: ColorManager.Clouds1, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: feedController.height.value == 0
                          ? ColorManager.white
                          : ColorManager.Clouds2,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: feedController.height.value,
                    width: feedController.width.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButton(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              autofocus: true,
                              onPressed: () {
                                feedController.height.value = 0;
                                feedController.width.value = 0;
                              },
                              icon: const Icon(FontAwesomeIcons.close),
                              color: ColorManager.grey,
                              iconSize: 20,
                              alignment: Alignment.center,
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(Get.width / 8, Get.height / 19.2)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorManager.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ColorManager.white3, width: 1),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Flexible(
                                flex: 3,
                                child: ListTile(
                                  title: CustomTextWidget(
                                      Txt: "Nizar Aoun",
                                      color: ColorManager.black,
                                      size: 18,
                                      fontweight: FontWeight.w500,
                                      spacing: 0.1),
                                  subtitle: Container(
                                    height: Get.height / 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorManager.white, width: 1),
                                      color: ColorManager.lightBlue2,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: DropdownButton<String>(
                                      iconSize: 18,
                                      underline: Container(
                                        height: 0,
                                        color: ColorManager.white,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      autofocus: false,
                                      hint: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Gap(5.0),
                                          Icon(
                                            FontAwesomeIcons.globeAsia,
                                            size: 18,
                                          ),
                                          Gap(5.0),
                                          Text('العامة  '),
                                        ],
                                      ),
                                      focusColor: ColorManager.blue,
                                      dropdownColor: ColorManager.white1,
                                      iconDisabledColor: ColorManager.grey,
                                      iconEnabledColor: ColorManager.grey,
                                      items: <String>['true', 'false']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {},
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    radius: Get.width / 16,
                                    backgroundImage: const AssetImage(
                                        'assets/images/userimage.png'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height / 3.5,
                          child: TextField(
                            textAlign: TextAlign.right,
                            maxLines: null,
                            onTap: () {},
                            decoration: InputDecoration(
                              hintText: 'اضافة مدونة جديدة',
                              hintStyle: TextStyle(
                                  color: ColorManager.blackLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                              fillColor: ColorManager.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ButtonWidget(
                            onpress: () {},
                            color1: ColorManager.greenbtn2,
                            color2: ColorManager.white,
                            icon: FontAwesomeIcons.paperPlane,
                            txt: '  نشر'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorManager.white2,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            excludeHeaderSemantics: true,
            leadingWidth: 0,
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
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned(
                      left: 0,
                      top: 10,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: Get.width / 1.8,
                        height: Get.height / 6,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: ColorManager.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.white3,
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: const Offset(2, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            const Gap(5),
                            CustomTextWidget(
                                Txt: "أهلا بك في صحتك",
                                color: ColorManager.black,
                                size: 16,
                                fontweight: FontWeight.bold,
                                spacing: 0.1),
                            const Gap(5),
                            CustomTextWidget(
                                Txt:
                                    "اطرح اسئلتك واستفساراتك وشاركنا تجاربك ومعلوماتك الطبية والصحية",
                                color: ColorManager.black,
                                size: 13,
                                fontweight: FontWeight.w400,
                                spacing: 0),
                            const Gap(10),
                            SizedBox(
                              width: Get.width / 2,
                              height: Get.height / 30,
                              child: ButtonWidget(
                                onpress: () {
                                  feedController.openaddfeed();
                                },
                                color1: ColorManager.greenbtn2,
                                color2: ColorManager.white,
                                icon: FontAwesomeIcons.shareFromSquare,
                                txt: 'اضافة مدونة',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/women.png',
                      colorBlendMode: BlendMode.darken,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: Get.width / 1.2,
                    margin: const EdgeInsets.only(top: 15, left: 25, right: 25),
                    height: Get.height / 4,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.white3, width: 1),
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.white3,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                              const Offset(2, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: CustomTextWidget(
                              Txt: "Nizar Aoun",
                              color: ColorManager.black,
                              size: 18,
                              fontweight: FontWeight.w500,
                              spacing: 0.1),
                          subtitle: CustomTextWidget(
                              Txt: "12/02/2024",
                              color: ColorManager.grey1,
                              size: 15,
                              fontweight: FontWeight.w300,
                              spacing: 0.1),
                          leading: CircleAvatar(
                            radius: Get.width / 16,
                            backgroundImage:
                                const AssetImage('assets/images/userimage.png'),
                          ),
                        ),
                        CustomTextWidget(
                            Txt:
                                "أشعر بالسعادة لكوني في مغامرة ملحمية أخرى! لقد وصلت للتو إلى مدينة برشلونة الجميلة",
                            color: ColorManager.blackLight,
                            size: 15,
                            fontweight: FontWeight.w300,
                            spacing: 0.1),
                        const Spacer(),
                        Row(
                          children: [
                            CustomIconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.solidHeart),
                              color: ColorManager.grey,
                              iconSize: 20,
                              alignment: Alignment.center,
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(Get.width / 10, Get.height / 19.2)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorManager.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ColorManager.white3, width: 1),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                              ),
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              autofocus: true,
                            ),
                            Gap(Get.width / 20),
                            CustomIconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.comments),
                              color: ColorManager.grey,
                              iconSize: 20,
                              alignment: Alignment.center,
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(Get.width / 10, Get.height / 19.2)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorManager.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ColorManager.white3, width: 1),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                              ),
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: -4),
                              autofocus: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          )
        ]));
  }
}

//
//
// ListView.separated(
//   itemCount: 5,
//   itemBuilder: (context, index) => const NewsCardSkelton(),
//   separatorBuilder: (context, index) =>
//       const SizedBox(height: defaultPadding),
// )

