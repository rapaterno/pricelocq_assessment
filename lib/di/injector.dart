import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pricelocq_assessment/config/config.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';
import 'package:pricelocq_assessment/data/repository/auth/auth_repository_impl.dart';
import 'package:pricelocq_assessment/data/service/interceptors/auth_interceptor.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';
import 'package:pricelocq_assessment/data/storage/secure_storage.dart';
import 'package:pricelocq_assessment/domain/features/auth/auth_bloc.dart';

final injector = GetIt.instance;

void setupInjector(Config config) {
  injector.registerSingleton<Config>(config);

  injector.registerSingleton<AbstractStorage>(
      SecureStorage(const FlutterSecureStorage()));

  injector.registerLazySingleton<Dio>(() =>
      Dio(BaseOptions(baseUrl: config.baseUrl))
        ..interceptors.add(AuthInterceptor(storage: Injector.storage)));

  injector.registerSingleton<AbstractAuthRepository>(
      AuthRepositoryImpl(Injector.dio));
  injector.registerSingleton<AuthBloc>(AuthBloc(
      injector<AbstractAuthRepository>(), injector<AbstractStorage>()));
}

abstract class Injector {
  static Config get config => injector<Config>();

  static AbstractStorage get storage => injector<AbstractStorage>();

  static Dio get dio => injector<Dio>();

  static AbstractAuthRepository get authRepository =>
      injector<AbstractAuthRepository>();

  static AuthBloc get authBloc => injector<AuthBloc>();
}
