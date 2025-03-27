import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.sharedPrefDataSource,
    required this.authService,
  });

  final AuthService authService;
  final SharedPrefDataSource sharedPrefDataSource;

  @override
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final result = await authService.login(
      username: username,
      password: password,
    );
    print(result);

    final token = result['token'] as String?;
    if (token == null) {
      throw Exception('No token received');
    }

    await sharedPrefDataSource.saveToken(token);
  }
}
