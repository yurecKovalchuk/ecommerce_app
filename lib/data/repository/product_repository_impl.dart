import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/app/app.dart';
import 'package:ecommerce_app/data/data.dart';
import 'package:ecommerce_app/data/mapper/product_mapper.dart';
import 'package:ecommerce_app/domain/domain.dart';

import '../../domain/models/product.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._fakeStoreService);

  final FakeStoreService _fakeStoreService;

  @override
  Future<List<Product>> getProducts({
    int limit = paginationLimit,
    int offset = paginationOffset,
  }) =>
      _handleGetProducts(limit: limit, offset: offset);

  @override
  Future<Product> getProductById(int id) async {
    final raw = await _fakeStoreService.getProductById(id);
    final dto = ProductDTO.fromJson(raw);
    return dto.toEntity();
  }

  Future<List<Product>> _handleGetProducts({
    required int limit,
    required int offset,
  }) async {
    final rawList = await _fakeStoreService.getProducts(
      limit: limit,
      offset: offset,
    );

    return rawList
        .map((item) => ProductDTO.fromJson(item as Map<String, dynamic>))
        .map((dto) => dto.toEntity())
        .toList();
  }
}