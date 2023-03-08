import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/di/injector.dart';
import 'package:pricelocq_assessment/domain/features/map/map_bloc.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';
import 'package:pricelocq_assessment/l10n/generated/locq_localization.dart';
import 'package:pricelocq_assessment/presentation/utils/distance_utils.dart';
import 'package:pricelocq_assessment/presentation/widgets/selected_station_tile.dart';
import 'package:pricelocq_assessment/presentation/widgets/station_list_tile.dart';
import 'package:pricelocq_assessment/presentation/widgets/station_map.dart';
import 'package:pricelocq_assessment/res/colors.dart';

enum SearchStationMode { map, textSearch }

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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

  @override
  void dispose() {
    Injector.mapBloc.add(const MapEvent.stopLocationStream());
    super.dispose();
  }
}
