import '../../dashboard/model/pin_model.dart';

enum UsersPinStatus {
  initial,
  loading,
  success,
  failure,
}

class UsersPinState {
  final UsersPinStatus status;
  final List<UserPinModel> usersPin;
  final String message;

  UsersPinState({
    required this.status,
    required this.message,
    required this.usersPin,
  });

  factory UsersPinState.initial() {
    return UsersPinState(
      status: UsersPinStatus.initial,
      usersPin: [],
      message: '',
    );
  }

  UsersPinState copyWith({
    UsersPinStatus? status,
    List<UserPinModel>? usersPin,
    String? message,
  }) {
    return UsersPinState(
      status: status ?? this.status,
      usersPin: usersPin ?? this.usersPin,
      message: message ?? this.message,
    );
  }
}
