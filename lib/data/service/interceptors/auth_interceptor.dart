import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';
import 'package:pricelocq_assessment/data/storage/storage_keys.dart';

class AuthInterceptor extends Interceptor {
  final AbstractStorage storage;

  AuthInterceptor({required this.storage});

  @override
  FutureOr onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await storage.read(key: StorageKeys.accessToken);

    if (accessToken != null) {
      options.headers['Authorization'] = accessToken;
    }

    return super.onRequest(options, handler);
  }
}
