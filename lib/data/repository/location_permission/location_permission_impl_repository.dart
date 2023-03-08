import 'package:geolocator/geolocator.dart' as geo;
import 'package:pricelocq_assessment/data/repository/location_permission/abstract_location_permission_repository.dart';

class LocationPermissionRepository
    implements AbstractLocationPermissionRepository {
  @override
  Future<LocationPermission> checkLocationPermission() async {
    final permission = await geo.Geolocator.checkPermission();

    return _getLocationPermission(permission);
  }

  @override
  Future<LocationPermission> requestLocationPermission() async {
    final permission = await geo.Geolocator.requestPermission();

    return _getLocationPermission(permission);
  }

  LocationPermission _getLocationPermission(geo.LocationPermission permission) {
    if (permission == geo.LocationPermission.denied ||
        permission == geo.LocationPermission.deniedForever) {
      return LocationPermission.denied;
    } else {
      return LocationPermission.granted;
    }
  }
}
