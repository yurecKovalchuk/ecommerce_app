import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/product.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<Product> products,
    @Default(false) bool hasReachedEnd,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefreshing,
    @Default(true) bool hasMore,
    @Default('') String errorMessage,
    @Default(0) int offset,
  }) = _HomeState;
}
