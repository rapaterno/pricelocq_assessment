import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';

part 'station_state.dart';
part 'station_event.dart';
part 'station_bloc.freezed.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final AbstractStationRepository _repository;
  StationBloc(this._repository) : super(const StationState()) {
    on<StationEventGetStations>(_onGetStations);
    on<StationEventFilterStations>(_onFilterStations,
        transformer: restartable());
    on<StationEventSelectStation>(_onSelectStations);
    on<StationEventSortByDistance>(_onSortByDistance);
  }

  void _onSortByDistance(
      StationEventSortByDistance event, Emitter<StationState> emit) async {
    final stations = state.stations;
    final userLocation = event.latLng;

    final sortedStations = List<Station>.from(stations);

    Map<int, double> distanceOfStationMap = {};

    sortedStations.sort(
      ((a, b) {
        final distanceOfA =
            distanceOfStationMap[a.id] ?? getDistance(a, userLocation);
        final distanceOfB =
            distanceOfStationMap[b.id] ?? getDistance(b, userLocation);

        distanceOfStationMap.putIfAbsent(a.id, () => distanceOfA);
        distanceOfStationMap.putIfAbsent(b.id, () => distanceOfB);

        return distanceOfA.compareTo(distanceOfB);
      }),
    );

    emit(state.copyWith(
      stations: sortedStations,
      distanceOfStationMap: distanceOfStationMap,
    ));
  }

  double getDistance(Station station, LatLng userLocation) {
    final distanceInMeters = Geolocator.distanceBetween(
        station.latLng.latitude,
        station.latLng.longitude,
        userLocation.latitude,
        userLocation.longitude);

    return (distanceInMeters / 1000).truncateToDouble();
  }

  void _onGetStations(
      StationEventGetStations event, Emitter<StationState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      selected: null,
      stations: [],
      filteredStations: [],
      error: null,
    ));

    try {
      final stations = await _repository.getStationList();
      emit(state.copyWith(isLoading: false, stations: stations));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void _onFilterStations(
      StationEventFilterStations event, Emitter<StationState> emit) async {
    final query = event.query;

    final stations = state.stations;

    final filteredStations = stations
        .where((station) =>
            station.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filteredStations: filteredStations));
  }

  void _onSelectStations(
      StationEventSelectStation event, Emitter<StationState> emit) async {
    emit(state.copyWith(selected: event.station));
  }
}
