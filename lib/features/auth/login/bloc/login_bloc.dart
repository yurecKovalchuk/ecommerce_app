import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/domain.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc({
    required this.authRepository,
  }) : super(const LoginState());

  final AuthRepository authRepository;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await authRepository.login(
        username: username,
        password: password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
