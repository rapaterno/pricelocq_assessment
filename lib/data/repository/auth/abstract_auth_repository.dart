enum ProfileType { plc }

abstract class AbstractAuthRepository {
  Future<String> login(
      {required String username,
      required String password,
      ProfileType profileType = ProfileType.plc});
}
