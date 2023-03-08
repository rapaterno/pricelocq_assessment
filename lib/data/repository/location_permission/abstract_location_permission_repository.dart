enum LocationPermission { granted, denied }

abstract class AbstractLocationPermissionRepository {
  Future<LocationPermission> checkLocationPermission();

  Future<LocationPermission> requestLocationPermission();
}
