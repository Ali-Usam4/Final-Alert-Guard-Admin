import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/exceptions/api_error.dart';
import '../../models/auth_response.dart';
import '../../models/signup_input.dart';
import '../../repository/auth_repository.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  void enableAutoValidateMode() => emit(state.copyWith(
        isAutoValidate: true,
        signupStatus: SignupStatus.initial,
      ));

  void toggleShowPassword() => emit(state.copyWith(
        isPasswordHidden: !state.isPasswordHidden,
        signupStatus: SignupStatus.initial,
      ));

  void toggleShowConfirmPassword() => emit(state.copyWith(
        isConfirmPasswordHidden: !state.isConfirmPasswordHidden,
        signupStatus: SignupStatus.initial,
      ));

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  Future<void> signup(SignupInput signupInput) async {
    emit(state.copyWith(signupStatus: SignupStatus.loading));
    try {
      // signupInput.fcmToken = await sl<CloudMessagingApi>().getFcmToken() ?? '';

      AuthResponse authResponse = await _authRepository.signup(signupInput);
      if (authResponse.result == 'success') {
        emit(state.copyWith(
            signupStatus: SignupStatus.success,
            errorMessage: authResponse.message));
      } else {
        emit(state.copyWith(
            signupStatus: SignupStatus.error,
            errorMessage: authResponse.message));
      }
    } on ApiError catch (e) {
      emit(state.copyWith(
        signupStatus: SignupStatus.error,
        errorMessage: e.message,
      ));
    }
  }
}
