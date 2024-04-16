import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:translator/translator.dart';
import '../../../model/governerat.dart';
import '../../../service/home/pharmacyLocations.dart';

abstract class PharmacyLocations extends GetxController {
  final translator = GoogleTranslator();
  // Define a RxList to hold pharmacy names
  RxList<String> pharmacyNames = <String>[].obs;
  RxList<double> rating = <double>[].obs;
  RxList<String> location = <String>[].obs;
  RxList<String> vicinity = <String>[].obs;
  final Set<Marker> marker = {};

  RxString? nextPagephamacy;
  RxBool isNextPageLoading = false.obs;
  RxString? nextPageVille;
  RxList<GovernorateData> governoratesData = <GovernorateData>[].obs;
  String? selectedvalue;
  RxString? governorateactulle = ''.obs;
  RxBool isLoading = true.obs; // Add isLoading variable and initialize it
  // Abstract method to be implemented by subclasses
  void fetchPharmacy(double lat, lng);
  void getCurrentLocation();
}

class PharmacyLocationsimp extends PharmacyLocations {
  @override
  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      fetchPharmacy(position.latitude, position.longitude);
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void fetchPharmacy(double lat, lng) async {
    // Set isLoading to true before fetching data
    isLoading(true);

    // Perform asynchronous operations to fetch pharmacy data
    try {
      await PharmacyLocationsService().fetchPharmacyLocations(lat, lng);
      // Update the pharmacyNames list
      pharmacyNames
          .assignAll(PharmacyLocationsService().controller.pharmacyNames);
      // Set isLoading to false once data fetching is complete
      rating.assignAll(PharmacyLocationsService().controller.rating);

      vicinity.assignAll(PharmacyLocationsService().controller.vicinity);

      isLoading(false);
    } catch (e) {
      // Set isLoading to false in case of error as well
      isLoading(false);
    }
  }
}
