// Define a model class to hold latitude and longitude
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  // final MarkerId markerId = const MarkerId("1");
  final Set<Marker> markers = {};

  LocationModel({required this.latitude, required this.longitude}) {
    markers.add(Marker(
      markerId: MarkerId(latitude.toString()),
      position: LatLng(latitude, longitude),
    ));
  }
}
