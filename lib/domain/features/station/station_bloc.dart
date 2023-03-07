import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';

part 'station_state.dart';
part 'station_event.dart';
part 'station_bloc.freezed.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final AbstractStationRepository _repository;
  StationBloc(this._repository) : super(const StationState()) {
    on<StationEventGetStations>(_onGetStations);
    on<StationEventFilterStations>(_onFilterStations);
    on<StationEventSelectStation>(_onSelectStations);
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
    ;
    emit(state.copyWith(filteredStations: filteredStations));
  }

  void _onSelectStations(
      StationEventSelectStation event, Emitter<StationState> emit) async {
    // emit(const StationState.loading());
    emit(state.copyWith(selected: event.station));
  }
}