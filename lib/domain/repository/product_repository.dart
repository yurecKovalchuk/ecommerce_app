import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int limit, int offset});
  Future<Product> getProductById(int id);
}
