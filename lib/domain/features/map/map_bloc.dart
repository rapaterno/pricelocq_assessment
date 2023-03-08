import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';
part 'map_event.dart';
part 'map_bloc.freezed.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  StreamSubscription<Position>? locationStream;
  MapBloc() : super(const MapState.initial()) {
    on<MapEventStartLocationStream>(_startLocationStream);
    on<MapEventStopLocationStream>(_stopLocationStream);
    on<MapEventUpdateLocation>(_updateLocation);
  }

  void _startLocationStream(
      MapEventStartLocationStream event, Emitter<MapState> emit) async {
    locationStream = Geolocator.getPositionStream(
            intervalDuration: const Duration(milliseconds: 2000))
        .listen((event) {
      final latLng = LatLng(event.latitude, event.longitude);
      add(MapEvent.updateLocation(latLng));
    });
  }

  void _stopLocationStream(
      MapEventStopLocationStream event, Emitter<MapState> emit) async {
    await locationStream?.cancel();
  }

  void _updateLocation(
      MapEventUpdateLocation event, Emitter<MapState> emit) async {
    emit(MapState.loaded(event.latLng));
  }

  @override
  Future<void> close() {
    locationStream?.cancel();
    return super.close();
  }
}
