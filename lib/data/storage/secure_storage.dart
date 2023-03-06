import 'package:pricelocq_assessment/data/storage/abstract_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements AbstractStorage {
  final FlutterSecureStorage storage;

  SecureStorage(this.storage);
  @override
  Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    return await storage.write(key: key, value: value);
  }
}
