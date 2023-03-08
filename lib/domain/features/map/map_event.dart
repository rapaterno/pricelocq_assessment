part of 'map_bloc.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.startLocationStream() = MapEventStartLocationStream;
  const factory MapEvent.updateLocation(LatLng latLng) = MapEventUpdateLocation;
  const factory MapEvent.stopLocationStream() = MapEventStopLocationStream;
}
