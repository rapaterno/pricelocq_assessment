part of 'location_permission_cubit.dart';

@freezed
class LocationPermissionState with _$LocationPermissionState {
  const factory LocationPermissionState.initial() = LocationPermissionInitial;
  const factory LocationPermissionState.inProgress() =
      LocationPermissionInProgress;
  const factory LocationPermissionState.denied() = LocationPermissionDenied;
  const factory LocationPermissionState.granted() = LocationPermissionGranted;
}
