import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;
import '../../../model/geolocation.dart';
import '../../../model/geolocation.dart';
import '../../shared preferences/connection controller.dart';

abstract class MapLocation extends GetxController {
  Internetcontrollerimp controller = Get.put(Internetcontrollerimp());
  Uint8List? markerImage;
  List<String> image = [
    'image/car.png',
    'image/marker.png',
  ];
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  getBytesFromAsset(String path, int width);
  @override
  onInit();
  // LocationModel? locationModel;
}

class MapLocationimp extends MapLocation {
  @override
  void onInit() async {
    LocationModel location = await controller.determinePosition();
    lat = location.latitude.obs;
    long = location.longitude.obs;
    markerImage = await getBytesFromAsset(image[1], 100);
    super.onInit();
    update();
  }

  @override
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
