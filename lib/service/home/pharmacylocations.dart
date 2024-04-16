// ignore_for_file: prefer_null_aware_operators

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../controller/home/phamacy/pharmcie_controller.dart';

class PharmacyLocationsService {
  final PharmacyLocationsimp controller = Get.find();
  String apiKey =
      'AIzaSyDwEuBRB0T3HP4NTYw2wMd1TUI-aZosUGc'; // Replace with your actual API key
  Future<void> fetchPharmacyLocations(double lat, lng) async {
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=40000&type=pharmacy&key=$apiKey';

    do {
      final response = await http.get(Uri.parse(baseUrl));
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        controller.pharmacyNames.addAll(List<String>.from(data['results']
            .where((result) =>
                (result['name'] as String).toLowerCase().contains('pharmacy') ||
                (result['name'] as String).toLowerCase().contains('صيدلية') ||
                (result['name'] as String).toLowerCase().contains('pharmacie'))
            .map((result) {
          String name = result['name'];

          // Remove "EP" and the last part of the name if it contains "EP"
          if (name.toLowerCase().contains('ep')) {
            List<String> parts = name.split(' ');
            parts.removeWhere((part) => part.toLowerCase() == 'ep');
            return parts.sublist(0, parts.length - 1).join(' ');
          } else {
            return name;
          }
        })));

        controller.rating.addAll(List<double>.from(data['results']
            .map((result) =>
                result['rating'] != null ? result['rating'].toDouble() : null)
            .where((rating) => rating != null)));

        controller.vicinity.addAll(List<String>.from(data['results']
            .map((result) => result['vicinity'] != null
                ? result['vicinity'].toString()
                : null)
            .where((vicinity) => vicinity != null)));
        controller.marker
            .addAll(Set.from(data['results'].map((result) => Marker(
                  markerId: MarkerId(result['name']),
                  position: LatLng(result['geometry']['location']['lat'],
                      result['geometry']['location']['lng']),
                ))));

        if (controller.pharmacyNames.length > controller.rating.length) {
          int remainingCount =
              controller.pharmacyNames.length - controller.rating.length;
          for (int i = 0; i < remainingCount; i++) {
            controller.rating.add(0);
          }
        }
        if (data['next_page_token'] != null) {
          controller.nextPagephamacy = data['next_page_token'];
          controller.isNextPageLoading(true);
        } else {
          controller.isNextPageLoading(false);
          // Set isLoading to false once data fetching is complete
        }
      } else {
        break; // Exit loop if status is not OK
      }
    } while (controller.isNextPageLoading.value == true);
  }
}

  // Future<void> fetchGovernorates() async {
  //   // final apiUrl =
  //   //     'https://maps.googleapis.com/maps/api/place/textsearch/json?query=governorate+in+Tunisia&key=$apiKey';
  //   List<GovernorateData> allGovernorates = [];
  //   // try {
  //   //   String? nextPageToken;

  //   //   do {
  //   //     var url = apiUrl;

  //   //     if (nextPageToken != null) {
  //   //       url += '&pagetoken=$nextPageToken';
  //   //     }

  //   //     final response = await http.get(Uri.parse(url));

  //   //     if (response.statusCode == 200) {
  //   //       final data = json.decode(response.body);
  //   //       final results = data['results'] as List<dynamic>;
  //   //       nextPageToken = data['next_page_token'] as String?;

  //   //       for (var result in results) {
  //   //         String name = result['name'];
  //   //         Map<String, dynamic> geometry = result['geometry'];
  //   //         Map<String, dynamic> locationData = geometry['location'];
  //   //         double lat = locationData['lat'];
  //   //         double lng = locationData['lng'];

  //   //         if (name.toLowerCase().contains('governorate')) {
  //   //           name = name
  //   //               .replaceAll(RegExp(r'governorate', caseSensitive: false), '')
  //   //               .trim();
  //   //         }

  //   //         );
  //   //       }
  //   //     } else {
  //   //       throw Exception('Failed to fetch data');
  //   //     }
  //   //   } while (nextPageToken != null);

  //   //   controller.governoratesData.assignAll(allGovernorates);
  //   // } catch (e) {
  //   //   print(e);
  //   // }
  // }

