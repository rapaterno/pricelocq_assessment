part of 'station_bloc.dart';

/// [distanceOfStationMap] is a Map with the key of the station id,
/// and the value being the distance of that station from the user
@freezed
class StationState with _$StationState {
  const factory StationState({
    @Default(false) bool isLoading,
    @Default([]) List<Station> stations,
    @Default([]) List<Station> filteredStations,
    @Default({}) Map<int, double> distanceOfStationMap,
    Station? selected,
    Object? error,
  }) = _StationState;
}
