import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/domain/features/map/map_bloc.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';

class StationMap extends StatelessWidget {
  const StationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return Builder(
        builder: (context) =>
            BlocBuilder<MapBloc, MapState>(builder: (context, state) {
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
            }));
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

  Widget buildMap(LatLng latLng) {
    return BlocBuilder<StationBloc, StationState>(
      buildWhen: (prev, current) => prev.selected != current.selected,
      builder: (context, state) {
        return GoogleMap(
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
              () => EagerGestureRecognizer(),
            ),
          },
          markers: buildMarkers(state.selected),
          initialCameraPosition: CameraPosition(target: latLng, zoom: 17),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
      },
    );
  }
}
