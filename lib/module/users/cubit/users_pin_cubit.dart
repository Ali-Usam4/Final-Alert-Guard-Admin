import 'package:final_alert_guard_admin/module/users/repository/users_pin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'users_pin_state.dart';

class UsersPinCubit extends Cubit<UsersPinState> {
  UsersPinCubit(this._repository) : super(UsersPinState.initial());

  final UsersPinRepository _repository;

  void getUserPins() {
    emit(state.copyWith(status: UsersPinStatus.loading));
    _repository.getUsersPins().listen((userPins) {
      emit(state.copyWith(status: UsersPinStatus.success, usersPin: userPins));
    }).onError((error) {
      emit(state.copyWith(status: UsersPinStatus.failure, message: error.toString()));
    });
  }
}
