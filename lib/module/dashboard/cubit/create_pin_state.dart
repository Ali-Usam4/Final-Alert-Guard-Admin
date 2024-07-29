part of 'create_pin_cubit.dart';

enum CreatePinStatus {
  initial,
  loading,
  success,
  failure,
}

class CreatePinState {
  final CreatePinStatus status;
  final String message;

  CreatePinState({
    required this.status,
    required this.message,
  });

  factory CreatePinState.initial() {
    return CreatePinState(
      status: CreatePinStatus.initial,
      message: '',
    );
  }

  CreatePinState copyWith({
    CreatePinStatus? status,
    String? message,
  }) {
    return CreatePinState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
