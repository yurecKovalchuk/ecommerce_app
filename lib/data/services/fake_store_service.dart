import 'package:dio/dio.dart';

import '../../app/app.dart';

class FakeStoreService {
  final Dio _dio;

  FakeStoreService(this._dio);

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await _dio.get('$fakeStoreApiUrl/products');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to fetch products: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    try {
      final response = await _dio.get('$fakeStoreApiUrl/products/$id');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to fetch product: ${e.message}');
    }
  }
}
