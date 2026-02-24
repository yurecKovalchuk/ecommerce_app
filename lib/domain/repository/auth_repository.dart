import 'package:ecommerce_app/domain/domain.dart';

abstract class AuthRepository {
  Future<void> login({
    required String username,
    required String password,
  });

  Future<void> logout();

  Future<String?> getToken();

  Future<UserModel?> getAuthenticatedUser();
}
