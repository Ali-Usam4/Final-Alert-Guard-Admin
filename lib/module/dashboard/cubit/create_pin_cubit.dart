import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/response_model.dart';
import '../repository/create_pin_repository.dart';

part 'create_pin_state.dart';

class CreatePinCubit extends Cubit<CreatePinState> {
  final CreatePinRepository _repository;

  CreatePinCubit(this._repository) : super(CreatePinInitial());

  void createCompanyPin(CompanyPinModel companyPin) async {
    emit(CreatePinLoading());
    try {
      await _repository.addCompanyPin(companyPin);
      emit(CreatePinSuccess());
    } catch (e) {
      emit(CreatePinFailure(e.toString()));
    }
  }

  void createUserPin(UserPinModel userPin) async {
    emit(CreatePinLoading());
    try {
      await _repository.addUserPin(userPin);
      emit(CreatePinSuccess());
    } catch (e) {
      emit(CreatePinFailure(e.toString()));
    }
  }
}
