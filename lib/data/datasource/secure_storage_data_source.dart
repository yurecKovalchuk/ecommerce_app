import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/domain/models/user_model.dart';

@lazySingleton
class SecureStorageDataSource {
  SecureStorageDataSource(this._storage);

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';
  static const _userKey = 'user_data';

  Future<void> saveToken(String token) => _storage.write(
    key: _tokenKey,
    value: token,
  );

  Future<String?> getToken() => _storage.read(key: _tokenKey);

  Future<void> clearToken() => _storage.delete(key: _tokenKey);

  Future<void> saveUser(UserModel user) => _storage.write(
    key: _userKey,
    value: jsonEncode(user.toJson()),
  );

  Future<UserModel?> getUser() async {
    final jsonString = await _storage.read(key: _userKey);
    return jsonString != null ? _parseUser(jsonString) : null;
  }

  Future<void> clearUser() => _storage.delete(key: _userKey);

  UserModel? _parseUser(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return UserModel.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}
