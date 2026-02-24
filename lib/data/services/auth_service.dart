import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/app/app.dart';

@injectable
class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$apiUrl/auth/login',
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

  Future<Map<String, dynamic>> refreshToken(String token) async {
    try {
      final response = await _dio.post(
        '$apiUrl/auth/refresh',
        data: {'refreshToken': token},
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    try {
      final response = await _dio.get(
        '$apiUrl/auth/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      return 'Error ${e.response?.statusCode}: ${e.response?.data}';
    }

    return 'Connection error: ${e.message}';
  }
}
