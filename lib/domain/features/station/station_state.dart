part of 'station_bloc.dart';

@freezed
class StationState with _$StationState {
  const factory StationState({
    @Default(false) bool isLoading,
    @Default([]) List<Station> stations,
    @Default([]) List<Station> filteredStations,
    Station? selected,
    Object? error,
  }) = _StationState;
}
