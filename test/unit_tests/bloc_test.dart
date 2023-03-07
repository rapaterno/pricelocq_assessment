import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';
import 'package:pricelocq_assessment/data/repository/station/abstract_station_repository.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';

import 'package:pricelocq_assessment/domain/features/auth/auth.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([
  AbstractAuthRepository,
  AbstractStationRepository,
  AbstractStorage,
])
void main() {
  final authRepo = MockAbstractAuthRepository();
  final storage = MockAbstractStorage();

  group('Auth Bloc', () {
    group('Login-', () {
      const username = 'username';
      const password = 'password';
      final loginFailError = Error();
      blocTest(
        'Login Success',
        build: () => AuthBloc(authRepo, storage),
        setUp: () {
          when(authRepo.login(username: username, password: password))
              .thenAnswer((realInvocation) => Future.value(''));
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
  });
}
