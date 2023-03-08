import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricelocq_assessment/data/repository/location_permission/abstract_location_permission_repository.dart';

part 'location_permission_state.dart';
part 'location_permission_cubit.freezed.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  final AbstractLocationPermissionRepository _repository;
  LocationPermissionCubit(this._repository)
      : super(const LocationPermissionState.initial());

  Future<void> checkPermission() async {
    emit(const LocationPermissionState.inProgress());
    final permission = await _repository.checkLocationPermission();
    if (permission == LocationPermission.denied) {
      final newPermission = await _repository.requestLocationPermission();
      if (newPermission == LocationPermission.denied) {
        emit(const LocationPermissionState.denied());
      }
    }
    emit(const LocationPermissionState.granted());
  }

  Future<void> requestPermission() async {
    emit(const LocationPermissionState.inProgress());
    final permissionStatus = await _repository.requestLocationPermission();

    if (permissionStatus == LocationPermission.granted) {
      emit(const LocationPermissionState.granted());
    } else {
      emit(const LocationPermissionState.denied());
    }
  }
}
