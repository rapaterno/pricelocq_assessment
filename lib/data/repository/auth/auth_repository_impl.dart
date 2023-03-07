import 'package:dio/dio.dart';
import 'package:pricelocq_assessment/data/repository/auth/abstract_auth_repository.dart';

class AuthRepositoryImpl implements AbstractAuthRepository {
  final Dio dio;

  AuthRepositoryImpl(this.dio);
  @override
  Future<String> login({
    required String username,
    required String password,
    ProfileType profileType = ProfileType.plc,
  }) async {
    Map<String, dynamic> json = {
      "mobileNumber": username,
      "password": password,
      "profileType": "plc"
    };

    final response = await dio.post('/ms-profile/user/login',
        data: json, options: Options(contentType: Headers.jsonContentType));
    final data = response.data['data'];
    return data['AccessToken'] as String;
  }
}
