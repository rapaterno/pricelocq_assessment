import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DistanceUtils {
  static double computeKmDistanceBetweenPoints(LatLng point1, LatLng point2) {
    final meterDistance = Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );

    return (meterDistance / 1000).truncateToDouble();
  }
}
