import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sahtech/utils/app_routes.dart';
import '../../../../controller/home/map/map.dart';
import '../../../../controller/home/phamacy/pharmcie_controller.dart';
import '../../../../model/geolocation.dart';
import '../../../../widgets/custom_icone_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../resources/color/color_manager.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({super.key});

  @override
  Widget build(BuildContext context) {
    MapLocationimp controller = Get.put(MapLocationimp());

    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              controller.lat == 0.0 && controller.long == 0.0) {
            // While waiting for the 5 seconds, display the Lottie animation
            return Center(
              child: Lottie.asset(
                'assets/images/loding.json', // Replace with your animation file path
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            );
          } else {
            // After 5 seconds, display the container
            return Stack(
              children: [
                GoogleMap(
                  markers: Set.from(LocationModel(
                    latitude: controller.lat.value,
                    longitude: controller.long.value,
                  ).markers.toList()),
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(controller.lat.value, controller.long.value),
                    zoom: 12.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    // You can use the controller to interact with the map
                    // For example, you can animate the camera to a specific location
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height / 20, left: 10),
                  width: Get.width,
                  child: Row(
                    children: [
                      CustomIconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          AppRoutes().goToEnd(AppRoutes.home);
                        },
                        color: ColorManager.blackLight,
                        style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(ColorManager.black),
                          backgroundColor:
                              MaterialStateProperty.all(ColorManager.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        tooltip: "الاشعارات",
                        iconSize: Get.width / 12,
                        alignment: Alignment.centerLeft,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        autofocus: true,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Get.width / 1.22,
                        height: Get.height / 11,
                        child: CustomTextFormField(
                          texthint: "ابحث عن الصيدليات",
                          validator: (value) {
                            return null;
                          },
                          icon: const Icon(Icons.search),
                          inputType: TextInputType.text,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
