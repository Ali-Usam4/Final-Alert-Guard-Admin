import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../../../core/exceptions/api_error.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/storage_service/storage_service.dart';
import '../../../utils/logger/logger.dart';
import '../../authentication/repository/session_repository.dart';
import '../../user/models/user_model.dart';
import '../models/update_profile_input.dart';

class UserAccountRepository {
  StorageService storageService;
  SessionRepository sessionRepository;
  DioClient dioClient;

  UserAccountRepository({
    required this.storageService,
    required this.sessionRepository,
    required this.dioClient,
  });

  final _log = logger(UserAccountRepository);

  Future<void> saveUserInDb(UserModel userModel) async {
    final userMap = userModel.toJson();
    await storageService.setString(StorageKeys.user, json.encode(userMap));
    _log.i('user saved in db');
  }

  UserModel getUserFromDb() {
    final userString = storageService.getString(StorageKeys.user);
    if (userString.isNotEmpty) {
      final Map<String, dynamic> userMap = jsonDecode(userString);
      UserModel userModel = UserModel.fromJson(userMap);
      _log.i('user loaded from local db $userModel');
      return userModel;
    } else {
      return UserModel.empty;
    }
  }

  Future<UserModel> updateProfile(UpdateProfileInput input) async {
    try {
      var response = await dioClient.patch(
        Endpoints.update,
        data: input.toFormData(),
      );

      if (response.data['result'] == 'success') {
        UserModel userModel = UserModel.fromJson(response.data['data']);
        await saveUserInDb(userModel);
        return userModel;
      }
      throw ApiError.fromDioException(response.data['message']);
    } on DioException catch (e, stackTrace) {
      _log.e(e, stackTrace: stackTrace);
      throw ApiError.fromDioException(e);
    } catch (e) {
      _log.e(e);
      throw ApiError(message: '$e', code: 0);
    }
  }

  Future<void> removeUserFromDb() async {
    await storageService.remove(StorageKeys.user);
    _log.i('user removed from db');
  }

  Future<void> logout() async {
    await sessionRepository.setLoggedIn(false);
    await sessionRepository.removeToken();
    await sessionRepository.clearLocalStorage();
    await removeUserFromDb();
    _log.i('logout successfully');
  }
}
