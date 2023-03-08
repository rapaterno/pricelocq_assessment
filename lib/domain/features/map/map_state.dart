part of 'map_bloc.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = MapStateIdle;
  const factory MapState.loaded(LatLng latLng) = MapStateLoaded;
  const factory MapState.error() = MapStateError;
}
