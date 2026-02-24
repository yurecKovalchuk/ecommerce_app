import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../app/app.dart';

@injectable
class FakeStoreService {
  final Dio _dio;

  FakeStoreService(this._dio);

  Future<List<dynamic>> getProducts({int limit = paginationLimit, int offset = paginationOffset}) async {
    final response = await _dio.get('$apiUrl/products');
    final all = response.data as List;
    final paginated = all.skip(offset).take(limit).toList();
    return paginated;
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    try {
      final response = await _dio.get('$apiUrl/products/$id');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Failed to fetch product: ${e.message}');
    }
  }
}
