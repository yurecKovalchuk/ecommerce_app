import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_rating.freezed.dart';

@freezed
class ProductRating with _$ProductRating {
  const factory ProductRating({
    required double rate,
    required int count,
  }) = _ProductRating;
}
