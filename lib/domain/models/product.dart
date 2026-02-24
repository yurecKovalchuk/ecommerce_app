import 'package:ecommerce_app/domain/models/product_rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required ProductRating rating,
  }) = _Product;
}
