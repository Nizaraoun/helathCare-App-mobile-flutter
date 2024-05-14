import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sahtech/controller/home/feed/feed_controller.dart';
import 'package:sahtech/view/home/home%20page/feed/widget/doctor_pub_list_item.dart';
import 'package:sahtech/widgets/customtext.dart';
import '../../../../model/comment.dart';
import '../../../resources/color/color_manager.dart';

class PublicationScreen extends StatelessWidget {
  final int index;
  final int commentCount;
  final feedController;
  final RxList<Commenter> commenterpub;

  const PublicationScreen(
      {super.key,
      required this.index,
      required this.commentCount,
      required this.commenterpub,
      this.feedController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white2,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: CustomTextWidget(
            Txt: "المنشور",
            color: ColorManager.black,
            size: Get.width * 0.05,
            fontweight: FontWeight.w500,
            spacing: 0.1),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                width: Get.width,
                height: Get.height / 3,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: DoctorPubListItem(
                  doctorPub: feedController.doctorpub[index],
                ),
              ),
              CustomTextWidget(
                  Txt: "  التعليقات  :  ",
                  color: ColorManager.darkestBlue,
                  size: Get.width * 0.06,
                  fontweight: FontWeight.bold,
                  spacing: 0.1),
              SizedBox(
                height: Get.height / 2,
                child: ListView.builder(
                  itemCount: commentCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding:
                          const EdgeInsets.only(left: 5, right: 10, bottom: 10),
                      width: Get.width,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: CustomTextWidget(
                                Txt: commenterpub[index].userName!,
                                color: ColorManager.black,
                                size: Get.width * 0.05,
                                fontweight: FontWeight.bold,
                                spacing: 0.1),
                            subtitle: CustomTextWidget(
                                Txt: commenterpub[index].createdAt!,
                                color: ColorManager.blackLight,
                                size: Get.width * 0.035,
                                fontweight: FontWeight.w300,
                                spacing: 0.1),
                            leading: CircleAvatar(
                                backgroundColor:
                                    ColorManager.primaryColor.withOpacity(0.1),
                                maxRadius: Get.width / 18,
                                child: CircleAvatar(
                                  radius: Get.width / 16,
                                  backgroundImage: const AssetImage(
                                      "assets/images/userimage.png"),
                                )),
                          ),
                          CustomTextWidget(
                              Txt: commenterpub[index].content!,
                              color: ColorManager.black,
                              size: Get.width * 0.05,
                              fontweight: FontWeight.w400,
                              spacing: 0.1),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
