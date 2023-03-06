import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loginInProgress() = AuthStateLoginInProgress;
  const factory AuthState.authenticated() = AuthStateAuthenticated;
  const factory AuthState.loginFailed({Object? error}) = AuthStateLoginFailed;
}
