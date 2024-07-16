import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/storage_service/storage_service.dart';
import '../../utils/logger/logger.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final _log = logger(AppCubit);
  final StorageService storageService;

  AppCubit(this.storageService) : super(AppState());

  void init() {
    emit(state.copyWith());
  }
}
