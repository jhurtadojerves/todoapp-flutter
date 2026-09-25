import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class TokenStorage {
  Future<({String access, String refresh})?> read();
  Future<void> write(String access, String refresh);
  Future<void> clear();
}

class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage([this.storage = const FlutterSecureStorage()]);
  final FlutterSecureStorage storage;
  @override
  Future<({String access, String refresh})?> read() async {
    final access = await storage.read(key: 'access');
    final refresh = await storage.read(key: 'refresh');
    if (access == null ||
        refresh == null ||
        access.isEmpty ||
        refresh.isEmpty) {
      await clear();
      return null;
    }
    return (access: access, refresh: refresh);
  }

  @override
  Future<void> write(String access, String refresh) async {
    try {
      await storage.write(key: 'refresh', value: refresh);
      await storage.write(key: 'access', value: access);
    } catch (_) {
      await clear();
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    await storage.delete(key: 'access');
    await storage.delete(key: 'refresh');
  }
}
