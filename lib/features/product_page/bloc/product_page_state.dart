import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ecommerce_app/domain/domain.dart';

part 'product_page_state.freezed.dart';

enum ProductPageStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ProductPageState with _$ProductPageState {
  const factory ProductPageState({
    @Default(ProductPageStatus.initial) ProductPageStatus status,
    @Default('') String errorMessage,
    Product? product,
  }) = _ProductPageState;
}
