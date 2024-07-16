
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _kTokenKey = "token";

class AuthSecuredStorage {
  final FlutterSecureStorage _storage;

  AuthSecuredStorage({
    FlutterSecureStorage? storage,
  }) : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
            );

  Future<void> writeToken({required String token}) async {
    await _storage.write(key: _kTokenKey, value: token);
  }

  Future<String> readToken() async {
    return await _storage.read(key: _kTokenKey) ?? 'empty-token';
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _kTokenKey);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
