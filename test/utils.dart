import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/model/time.dart';

abstract class TestUtils {
  static List<Station> generateTestStations(int length) {
    final random = Random();
    return List.generate(
      length,
      (index) => Station(
        id: index,
        name: 'name $index',
        latLng: LatLng(random.nextDouble() * 7, random.nextDouble() * 7),
        province: 'province $index',
        city: 'city $index',
        address: 'address $index',
        opensAt: Time(
            hour: random.nextInt(6),
            minute: random.nextInt(59),
            second: random.nextInt(59)),
        closesAt: Time(
            hour: random.nextInt(17) + 6,
            minute: random.nextInt(59),
            second: random.nextInt(59)),
        status: index % 2 == 0 ? StationStatus.active : StationStatus.inactive,
      ),
    );
  }
}
