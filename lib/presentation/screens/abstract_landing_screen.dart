import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/presentation/utils/distance_utils.dart';
import 'package:pricelocq_assessment/presentation/widgets/station_list_tile.dart';
import 'package:pricelocq_assessment/res/colors.dart';

import '../../domain/features/map/map_bloc.dart';
import '../../domain/features/station/station_bloc.dart';

enum SearchStationMode { map, textSearch }

abstract class AbstractLandingScreen extends StatefulWidget {
  const AbstractLandingScreen({super.key});
}

abstract class AbstractLandingScreenState extends State<AbstractLandingScreen> {
  SearchStationMode _searchStationMode = SearchStationMode.map;
  LocqLocalizations get localizations => LocqLocalizations.of(context)!;
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  void initState() {
    super.initState();
    Injector.stationBloc.add(const StationEvent.getStations());
    Injector.mapBloc.add(const MapEvent.startLocationStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              LatLng? userLocation =
                  mapState is MapStateLoaded ? mapState.latLng : null;

              if (_searchStationMode == SearchStationMode.map) {
                return buildMapBody(userLocation);
              } else {
                return buildTextSearchBody(userLocation);
              }
            },
          ),
        ),
        Container(
          color: LocqColors.purple,
          height: 15,
        )
      ],
    );
  }

  Widget buildMapBody(LatLng? userLocation);
  Widget buildTextSearchBody(LatLng? userLocation);

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: LocqColors.purple,
      elevation: 0,
      title: Center(
        child: Text(
          localizations.searchStation,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: LocqColors.white),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            localizations.whichPriceLOCQStationWillYouLikelyVisit,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: LocqColors.white),
          ),
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).push;
          },
          icon: const Icon(Icons.home)),
      actions: [buildAppBarAction()],
    );
  }

  Widget buildAppBarAction() {
    IconData icon;
    SearchStationMode modeToSwitchTo;
    if (_searchStationMode == SearchStationMode.textSearch) {
      icon = Icons.close;
      modeToSwitchTo = SearchStationMode.map;
    } else {
      icon = Icons.search;
      modeToSwitchTo = SearchStationMode.textSearch;
    }

    return IconButton(
        onPressed: (() {
          setState(() {
            _searchStationMode = modeToSwitchTo;
          });
        }),
        icon: Icon(icon));
  }

  List<Station> sortStationsByDistanceFromUser(
      LatLng userLocation, List<Station> stations) {
    final sortedStations = List<Station>.from(stations);

    sortedStations.sort(((a, b) => Geolocator.distanceBetween(a.latLng.latitude,
            a.latLng.longitude, userLocation.latitude, userLocation.longitude)
        .compareTo(Geolocator.distanceBetween(
            b.latLng.latitude,
            b.latLng.longitude,
            userLocation.latitude,
            userLocation.longitude))));

    return sortedStations;
  }

  Widget buildStationBody(
      {required LatLng? userLocation, bool isFilterMode = false}) {
    return BlocBuilder<StationBloc, StationState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.error != null) {
        return Center(
          child: IconButton(
            onPressed: () =>
                Injector.stationBloc.add(const StationEvent.getStations()),
            icon: const Icon(Icons.replay),
          ),
        );
      } else {
        List<Station> stations;
        if (isFilterMode) {
          stations = state.filteredStations.isNotEmpty
              ? state.filteredStations
              : state.stations;
        } else {
          stations = state.stations;
        }
        return buildStationList(stations, userLocation);
      }
    });
  }

  Widget buildStationList(
      List<Station> unsortedStations, LatLng? userLocation) {
    List<Station> stations;

    if (userLocation != null) {
      stations = sortStationsByDistanceFromUser(userLocation, unsortedStations);
    } else {
      stations = unsortedStations;
    }

    return ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];

          //TODO: Save this distance so not doubled operation
          final distanceFromUser = userLocation != null
              ? DistanceUtils.computeKmDistanceBetweenPoints(
                  station.latLng, userLocation)
              : null;
          return StationListTile(
              stationName: station.name,
              distanceFromUser: distanceFromUser,
              onTap: () {
                Injector.stationBloc.add(StationEvent.selectStation(station));
                setState(() {
                  _searchStationMode = SearchStationMode.map;
                });
              });
        });
  }

  @override
  void dispose() {
    Injector.mapBloc.add(const MapEvent.stopLocationStream());
    super.dispose();
  }
}