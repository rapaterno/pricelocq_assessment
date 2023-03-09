import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/domain/features/map/map_bloc.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';

const double kZoomLevel = 15;

class StationMap extends StatefulWidget {
  const StationMap({super.key});

  @override
  State<StationMap> createState() => _StationMapState();
}

class _StationMapState extends State<StationMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final localizations = LocqLocalizations.of(context)!;
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: buildMap,
            error: () => Center(
              child: Text(localizations.serverError),
            ),
          );
        },
      ),
    );
  }

  Set<Marker> buildMarkers(Station? selectedStation) {
    final markers = <Marker>{};

    if (selectedStation != null) {
      markers.add(Marker(
          markerId: MarkerId('Selected Station'),
          position: selectedStation.latLng));
    }
    return markers;
  }

  Future<void> goToSelectedStation(LatLng selectedStationLocation) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: selectedStationLocation,
        zoom: kZoomLevel,
      ),
    ));
  }

  Widget buildMap(LatLng latLng) {
    return BlocConsumer<StationBloc, StationState>(
      listenWhen: (previous, current) => previous.selected != current.selected,
      listener: (context, state) {
        if (state.selected != null) {
          goToSelectedStation(state.selected!.latLng);
        }
      },
      builder: (context, state) {
        final initialLatLng =
            state.selected != null ? state.selected!.latLng : latLng;
        return GoogleMap(
          onMapCreated: ((controller) => _controller.complete(controller)),
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          markers: buildMarkers(state.selected),
          initialCameraPosition:
              CameraPosition(target: initialLatLng, zoom: kZoomLevel),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
      },
    );
  }
}
