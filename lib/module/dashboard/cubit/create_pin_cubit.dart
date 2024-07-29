import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/pin_model.dart';
import '../repository/create_pin_repository.dart';

part 'create_pin_state.dart';

class CreatePinCubit extends Cubit<CreatePinState> {
  final CreatePinRepository _repository;

  CreatePinCubit(this._repository) : super(CreatePinState.initial());

  void createCompanyPin(CompanyPinModel companyPin) async {
    emit(state.copyWith(status: CreatePinStatus.loading));
    try {
      await _repository.addCompanyPin(companyPin);
      emit(state.copyWith(status: CreatePinStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreatePinStatus.failure, message: e.toString()));
    }
  }

  void createUserPin(UserPinModel userPin) async {
    emit(state.copyWith(status: CreatePinStatus.loading));
    try {
      await _repository.addUserPin(userPin);
      emit(state.copyWith(status: CreatePinStatus.success));
    } catch (e) {
      emit(state.copyWith(status: CreatePinStatus.failure, message: e.toString()));
    }
  }
}
