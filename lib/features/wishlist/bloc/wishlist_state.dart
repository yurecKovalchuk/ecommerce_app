import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ecommerce_app/domain/domain.dart';

part 'wishlist_state.freezed.dart';

enum WishlistStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState({
    @Default(WishlistStatus.initial) WishlistStatus status,
    @Default([]) List<Product> products,
    @Default('') String errorMessage,
  }) = _WishlistState;
}
