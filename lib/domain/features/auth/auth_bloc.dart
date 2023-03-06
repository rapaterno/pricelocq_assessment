import 'package:bloc/bloc.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractAuthRepository _repository;
  AuthBloc(this._repository) : super(const AuthStateInitial()) {
    on<AuthEventLogin>(_onLogin);
  }

  void _onLogin(AuthEventLogin event, Emitter<AuthState> emit) async {
    emit(const AuthStateLoginInProgress());

    try {
      await _repository.login(
          username: event.username, password: event.password);

      emit(const AuthStateAuthenticated());
    } catch (e) {
      emit(AuthStateLoginFailed(error: e));
    }
  }
}
