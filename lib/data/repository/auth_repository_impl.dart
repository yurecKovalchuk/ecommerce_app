import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/data/datasource/secure_storage_data_source.dart';
import 'package:ecommerce_app/domain/domain.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.secureStorageDataSource,
    required this.authService,
  });

  final AuthService authService;
  final SecureStorageDataSource secureStorageDataSource;

  @override
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final result = await authService.login(
      username: username,
      password: password,
    );

    await _handleAuthResponse(result);
  }

  @override
  Future<void> logout() => secureStorageDataSource.clearToken();

  @override
  Future<String?> getToken() => secureStorageDataSource.getToken();

  @override
  Future<UserModel?> getAuthenticatedUser() async {
    final token = await getToken();
    if (token == null) return null;

    try {
      final userData = await authService.getProfile(token);
      return UserModel.fromJson(userData);
    } catch (_) {
      return null;
    }
  }

  Future<void> _handleAuthResponse(Map<String, dynamic> result) async {
    final token = result['token'] as String?;
    if (token == null) {
      throw Exception('No token received');
    }

    await secureStorageDataSource.saveToken(token);
  }
}
