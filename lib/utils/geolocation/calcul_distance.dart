import 'dart:math';

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371; // Radius of the Earth in kilometers

  // Conversion of degrees to radians
  double lat1Radians = _degreesToRadians(lat1);
  double lon1Radians = _degreesToRadians(lon1);
  double lat2Radians = _degreesToRadians(lat2);
  double lon2Radians = _degreesToRadians(lon2);

  // Calculation of differences in latitudes and longitudes
  double latDifference = lat2Radians - lat1Radians;
  double lonDifference = lon2Radians - lon1Radians;

  // Haversine formula for distance calculation
  double a = pow(sin(latDifference / 2), 2) +
      cos(lat1Radians) * cos(lat2Radians) * pow(sin(lonDifference / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = earthRadius * c;

  return distance;
}

double _degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}
