import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ecommerce_app/domain/domain.dart';

part 'cart_state.freezed.dart';

enum CartStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(CartStatus.initial) CartStatus status,
    @Default([]) List<Product> items,
    @Default('') String errorMessage,
  }) = _CartState;

  const CartState._();

  /// Calculates total price of all items in the cart.
  double get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}
