import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ecommerce_app/domain/domain.dart';

part 'app_state.freezed.dart';

enum AppStatus {
  initial,
  authenticated,
  unauthenticated,
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus status,
    UserModel? user,
  }) = _AppState;
}
