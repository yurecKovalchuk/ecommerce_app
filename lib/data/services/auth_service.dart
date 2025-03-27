import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/app.dart';

@injectable
class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$fakeStoreApiUrl/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      return 'Error ${e.response?.statusCode}: ${e.response?.data}';
    } else {
      return 'Connection error: ${e.message}';
    }
  }
}
