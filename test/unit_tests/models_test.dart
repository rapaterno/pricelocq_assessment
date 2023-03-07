import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/model/time.dart';

void main() {
  group('Models Test', () {
    group('Time from 24 hour formatted string', () {
      const Map<String, Time> testCaseMap = {
        '00:00:00': Time(hour: 0, minute: 0, second: 0),
        '23:59:59': Time(hour: 23, minute: 59, second: 59),
        '24:2400': Time(hour: 0, minute: 0, second: 0),
      };

      for (var input in testCaseMap.keys) {
        final expected = testCaseMap[input];
        test('Input: $input, Expected: $expected', () {
          final actual = Time.from24HrFormat(input);
          expect(actual, equals(expected));
        });
      }
    });
    group('Station', () {
      test('Station from API Json', () {
        const id = 665;
        const name = 'DOX NOT YET ONBOARDED';
        const double latitude = 5;
        const double longitude = 10;
        const province = 'Abra';
        const city = 'Bangued';
        const address = 'DOX NOT YET ONBOARDED';
        const opensAt = '00:00:00';
        const closesAt = '23:59:59';
        const status = 'active';

        final json = {
          "stationId": id,
          "name": name,
          "latitude": latitude,
          "longitude": longitude,
          "province": province,
          "city": city,
          "address": address,
          "opensAt": opensAt,
          "closesAt": closesAt,
          "status": status,
        };

        final actual = Station.fromAPIJson(json);
        final expected = Station(
          id: id,
          name: name,
          latLng: const LatLng(latitude, longitude),
          province: province,
          city: city,
          address: address,
          opensAt: Time.from24HrFormat(opensAt),
          closesAt: Time.from24HrFormat(closesAt),
          status: (status == 'active')
              ? StationStatus.active
              : StationStatus.inactive,
        );

        expect(actual, equals(expected));
      });
    });
  });
}
