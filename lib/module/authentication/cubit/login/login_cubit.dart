import 'package:equatable/equatable.dart';
import 'package:final_alert_guard_admin/module/authentication/models/login_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/logger/logger.dart';
import '../../repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  final _log = logger(LoginCubit);

  void toggleShowPassword() => emit(state.copyWith(
        isPasswordHidden: !state.isPasswordHidden,
        loginStatus: LoginStatus.initial,
      ));

  void enableAutoValidateMode() => emit(state.copyWith(
        isAutoValidate: true,
        loginStatus: LoginStatus.initial,
      ));

  Future<void> login(LoginInput loginInput) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      final user = await _authRepository.login(loginInput);
      if (user != null) {
        emit(state.copyWith(loginStatus: LoginStatus.success));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.error, errorMessage: 'Invalid email or password'));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> updateEditMode(bool isEditMode) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    try {
      await _authRepository.updateEditMode(isEditMode);
      await _authRepository.updateUser();
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, errorMessage: e.toString()));
    }
  }
}
