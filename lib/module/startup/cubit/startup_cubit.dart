import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/dio_client.dart';
import '../../../utils/logger/logger.dart';
import '../../authentication/repository/session_repository.dart';
import '../../user/models/user_model.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  final _log = logger(StartupCubit);
  StartupCubit({
    required DioClient dioClient,
    required SessionRepository sessionRepository,
  })  : _dioClient = dioClient,
        _sessionRepository = sessionRepository,
        super(StartupState.initial());

  final DioClient _dioClient;
  final SessionRepository _sessionRepository;

  void init() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = _sessionRepository.isLoggedIn();
    _log.d('isLoggedIn :: $isLoggedIn');

    if (isLoggedIn) {
      String token = await _sessionRepository.getToken();
      _log.d('token :: $token');
      _dioClient.setToken(token);
      emit(state.copyWith(status: Status.authenticated));
    } else {
      emit(state.copyWith(status: Status.unauthenticated));
    }
  }
}
