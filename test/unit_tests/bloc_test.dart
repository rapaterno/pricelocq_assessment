import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pricelocq_assessment/data/model/station.dart';
import 'package:pricelocq_assessment/data/model/time.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';

import 'package:pricelocq_assessment/domain/features/auth/auth_bloc.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([
  AbstractAuthRepository,
  AbstractStationRepository,
  AbstractStorage,
])
void main() {
  group('Auth Bloc', () {
    final authRepo = MockAbstractAuthRepository();
    final storage = MockAbstractStorage();
    group('Login - ', () {
      const username = 'username';
      const password = 'password';
      final loginFailError = Error();
      blocTest(
        'Login Success',
        build: () => AuthBloc(authRepo, storage),
        setUp: () {
          when(authRepo.login(username: username, password: password))
              .thenAnswer((_) => Future.value(''));
        },
        act: (bloc) => bloc.add(const AuthEventLogin(username, password)),
        verify: (bloc) {
          verify(authRepo.login(username: username, password: password));
        },
        expect: () => [
          const AuthStateLoginInProgress(),
          const AuthStateAuthenticated(),
        ],
      );
      blocTest(
        'Login Failed',
        build: () => AuthBloc(authRepo, storage),
        setUp: () {
          when(authRepo.login(username: username, password: password))
              .thenThrow(loginFailError);
        },
        act: (bloc) => bloc.add(const AuthEventLogin(username, password)),
        expect: () => [
          const AuthStateLoginInProgress(),
          AuthStateLoginFailed(error: loginFailError)
        ],
      );
    });

    group('Station - ', () {
      final stationRepo = MockAbstractStationRepository();

      /// Test Cases
      /// loading > loaded ^
      /// loading > error ^
      /// loading > loaded > searched
      /// loading > loaded > selected
      final testStations = TestUtils.generateTestStations(5);
      final getStationError = Exception('get stations unsuccessful');

      blocTest(
        'Get Stations Error',
        build: () => StationBloc(stationRepo),
        setUp: () {
          when(stationRepo.getStationList()).thenThrow(getStationError);
        },
        act: (bloc) => bloc.add(const StationEvent.getStations()),
        expect: () => [
          const StationState(isLoading: true),
          StationState(isLoading: false, error: getStationError.toString())
        ],
      );

      blocTest(
        'Get Stations Success',
        build: () => StationBloc(stationRepo),
        setUp: () => when(stationRepo.getStationList())
            .thenAnswer((_) => Future.value(testStations)),
        act: (bloc) => bloc.add(const StationEvent.getStations()),
        verify: (bloc) => verify(stationRepo.getStationList()),
        expect: () => [
          const StationState(isLoading: true),
          StationState(isLoading: false, stations: testStations)
        ],
      );

      blocTest(
        'Filter Stations',
        build: () => StationBloc(stationRepo),
        setUp: () => when(stationRepo.getStationList())
            .thenAnswer((_) => Future.value(testStations)),
        act: (bloc) async {
          bloc.add(const StationEvent.getStations());

          bloc.add(const StationEvent.filterStations('3'));
        },
        expect: () => [
          const StationState(isLoading: true),
          StationState(isLoading: false, stations: testStations),
          StationState(
              isLoading: false,
              stations: testStations,
              filteredStations: [testStations[3]])
        ],
      );
      blocTest(
        'Select Station',
        build: () => StationBloc(stationRepo),
        setUp: () => when(stationRepo.getStationList())
            .thenAnswer((_) => Future.value(testStations)),
        act: (bloc) async {
          bloc.add(const StationEvent.getStations());

          bloc.add(StationEvent.selectStation(testStations[3]));
        },
        expect: () => [
          const StationState(isLoading: true),
          StationState(isLoading: false, stations: testStations),
          StationState(
              isLoading: false,
              stations: testStations,
              selected: testStations[3])
        ],
      );
    });
  });
}

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
              status: index % 2 == 0
                  ? StationStatus.active
                  : StationStatus.inactive,
            ));
  }
}
