part of 'create_pin_cubit.dart';

abstract class CreatePinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreatePinInitial extends CreatePinState {}

class CreatePinLoading extends CreatePinState {}

class CreatePinSuccess extends CreatePinState {}

class CreatePinFailure extends CreatePinState {
  final String error;

  CreatePinFailure(this.error);

  @override
  List<Object?> get props => [error];
}
