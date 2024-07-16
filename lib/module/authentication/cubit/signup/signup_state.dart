import 'package:equatable/equatable.dart';

enum SignupStatus {
  initial,
  loading,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final bool isAutoValidate;
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final String errorMessage;

  SignupState({
    required this.signupStatus,
    required this.isAutoValidate,
    required this.isPasswordHidden,
    required this.isConfirmPasswordHidden,
    required this.errorMessage,
  });

  factory SignupState.initial() {
    return SignupState(
        signupStatus: SignupStatus.initial,
        isAutoValidate: false,
        isPasswordHidden: true,
        isConfirmPasswordHidden: true,
        errorMessage: '');
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [signupStatus, isPasswordHidden, isConfirmPasswordHidden, isAutoValidate];

  SignupState copyWith({
    SignupStatus? signupStatus,
    bool? isAutoValidate,
    bool? isPasswordHidden,
    bool? isConfirmPasswordHidden,
    String? errorMessage,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      isAutoValidate: isAutoValidate ?? this.isAutoValidate,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isConfirmPasswordHidden:
          isConfirmPasswordHidden ?? this.isConfirmPasswordHidden,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
