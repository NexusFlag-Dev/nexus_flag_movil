import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  final _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  static const _KeyAccessToken = 'ACCESS_TOKEN';
  static const _keyRefreshToken = 'REFRESH_TOKEN';

  Future setKeyValue<T>(String key, T value) async {
    await _storage.write(key: key, value: value.toString());
  }

  Future saveSession({required String access, required String refresh}) async {
    await Future.wait([
      _storage.write(key: _KeyAccessToken, value: access),
      _storage.write(key: _keyRefreshToken, value: refresh),
    ]);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _KeyAccessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  Future clearSession() async {
    await _storage.deleteAll();
  }
}