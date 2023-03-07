part of 'station_bloc.dart';

@freezed
class StationEvent with _$StationEvent {
  const factory StationEvent.getStations() = StationEventGetStations;
  const factory StationEvent.filterStations(String query) =
      StationEventFilterStations;
  const factory StationEvent.selectStation(Station station) =
      StationEventSelectStation;
}
