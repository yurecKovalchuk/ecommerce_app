import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce_app/domain/domain.dart';
import 'app_state.dart';

@lazySingleton
class AppBloc extends Cubit<AppState> {
  AppBloc({required this.authRepository}) : super(const AppState()) {
    _initialize();
  }

  final AuthRepository authRepository;

  Future<void> _initialize() async {
    try {
      final user = await authRepository.getAuthenticatedUser();
      _handleAuthCheck(user);
    } catch (_) {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }
  }

  void logout() => _handleLogout();

  void _handleAuthCheck(UserModel? user) {
    if (user != null) {
      emit(state.copyWith(
        status: AppStatus.authenticated,
        user: user,
      ));
    } else {
      emit(state.copyWith(status: AppStatus.unauthenticated));
    }
  }

  Future<void> _handleLogout() async {
    await authRepository.logout();
    emit(state.copyWith(
      status: AppStatus.unauthenticated,
      user: null,
    ));
  }
}
