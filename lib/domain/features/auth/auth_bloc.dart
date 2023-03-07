import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';
import 'package:pricelocq_assessment/data/storage/storage_keys.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractAuthRepository _repository;
  final AbstractStorage _storage;
  AuthBloc(this._repository, this._storage) : super(const AuthStateInitial()) {
    on<AuthEventLogin>(_onLogin);
  }

  void _onLogin(AuthEventLogin event, Emitter<AuthState> emit) async {
    emit(const AuthStateLoginInProgress());

    try {
      final accessToken = await _repository.login(
          username: event.username, password: event.password);
      await _storage.write(key: StorageKeys.accessToken, value: accessToken);
      emit(const AuthStateAuthenticated());
    } catch (e) {
      emit(AuthStateLoginFailed(error: e));
    }
  }
}
