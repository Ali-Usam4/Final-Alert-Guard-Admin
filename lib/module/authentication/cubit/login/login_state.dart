part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final bool isPasswordHidden;
  final bool isAutoValidate;
  final String errorMessage;

  const LoginState({
    required this.loginStatus,
    required this.isPasswordHidden,
    required this.isAutoValidate,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return const LoginState(
      loginStatus: LoginStatus.initial,
      isPasswordHidden: true,
      isAutoValidate: false,
      errorMessage: '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [loginStatus, isPasswordHidden, isAutoValidate];

  LoginState copyWith({
    LoginStatus? loginStatus,
    bool? isPasswordHidden,
    bool? isAutoValidate,
    String? errorMessage,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isAutoValidate: isAutoValidate ?? this.isAutoValidate,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
