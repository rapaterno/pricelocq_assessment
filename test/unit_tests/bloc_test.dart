import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';
import 'package:pricelocq_assessment/domain/features/auth/auth_bloc.dart';
import 'package:pricelocq_assessment/domain/features/station/station_bloc.dart';

import '../utils.dart';
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
          StationState(isLoading: false, error: getStationError)
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
