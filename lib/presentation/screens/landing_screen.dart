import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';
import 'package:pricelocq_assessment/presentation/screens/abstract_landing_screen.dart';
import 'package:pricelocq_assessment/presentation/utils/distance_utils.dart';
import 'package:pricelocq_assessment/presentation/widgets/map/selected_station_tile.dart';
import 'package:pricelocq_assessment/presentation/widgets/map/station_map.dart';
import 'package:pricelocq_assessment/res/colors.dart';

class LandingScreen extends AbstractLandingScreen {
  const LandingScreen({super.key});

  @override
  State<AbstractLandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends AbstractLandingScreenState {
  @override
  Widget buildMapBody(LatLng? userLocation) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Positioned.fill(bottom: 200, child: StationMap()),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: buildStationInfoBox(userLocation),
        )
      ],
    );
  }

  Widget buildInfoBoxTitle(bool isSelected) {
    if (isSelected) {
      return TextButton(
          onPressed: () {
            Injector.stationBloc.add(const StationEvent.selectStation(null));
          },
          child: Text(
            localizations.backToList,
          ));
    } else {
      return Text(localizations.nearbyStations, style: textTheme.subtitle2);
    }
  }

  Widget buildInfoBoxContainer(
      double height, Widget child, bool isStationSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: LocqColors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: LocqColors.white,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      height: height,
      width: double.infinity,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        buildInfoBoxHeader(isStationSelected),
        child
      ]),
    );
  }

  Padding buildInfoBoxHeader(bool isStationSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInfoBoxTitle(isStationSelected),
          TextButton(
              onPressed: isStationSelected
                  ? () {
                      //No indicated action
                    }
                  : null,
              child: Text(
                localizations.done,
              ))
        ],
      ),
    );
  }

  Widget buildStationInfoBox(LatLng? userLocation) {
    return BlocBuilder<StationBloc, StationState>(builder: (context, state) {
      Widget child;
      double height;

      if (state.selected != null) {
        child = buildSelectedStation(userLocation);
        height = 200;
      } else {
        child = Expanded(child: buildStationBody(userLocation: userLocation));
        height = 300;
      }
      return buildInfoBoxContainer(height, child, state.selected != null);
    });
  }

  Widget buildSelectedStation(LatLng? userLocation) {
    return BlocBuilder<StationBloc, StationState>(builder: ((context, state) {
      final selectedStation = state.selected!;
      final distanceFromUser = userLocation != null
          ? DistanceUtils.computeKmDistanceBetweenPoints(
              userLocation, selectedStation.latLng)
          : null;

      return SelectedStationTile(
          stationName: selectedStation.name,
          address: selectedStation.address,
          city: selectedStation.city,
          province: selectedStation.province,
          distanceFromUser: distanceFromUser,
          opensAt: selectedStation.opensAt,
          closesAt: selectedStation.closesAt);
    }));
  }

  TextField buildStationSearchTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: localizations.search,
        filled: true,
        fillColor: LocqColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
      ),
      onChanged: (value) => Injector.stationBloc.add(
        StationEvent.filterStations(value),
      ),
    );
  }

  @override
  Widget buildTextSearchBody(LatLng? userLocation) {
    return Column(
      children: [
        Container(
          color: LocqColors.purple,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            children: [
              buildStationSearchTextField(),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
        Expanded(
          child:
              buildStationBody(userLocation: userLocation, isFilterMode: true),
        )
      ],
    );
  }
}
