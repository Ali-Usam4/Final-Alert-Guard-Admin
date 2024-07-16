import 'package:dio/dio.dart';

import '../../../../constants/api_endpoints.dart';
import '../../../../core/exceptions/api_error.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../utils/logger/logger.dart';
import '../../user/models/user_model.dart';
import '../../user/repository/user_account_repository.dart';
import '../models/auth_response.dart';
import '../models/login_input.dart';
import '../models/signup_input.dart';
import 'session_repository.dart';

class AuthRepository {
  final DioClient _dioClient;
  final UserAccountRepository _userAccountRepository;
  final SessionRepository _sessionRepository;

  final _log = logger(AuthRepository);

  AuthRepository({
    required DioClient dioClient,
    required UserAccountRepository userAccountRepository,
    required SessionRepository sessionRepository,
  })  : _dioClient = dioClient,
        _sessionRepository = sessionRepository,
        _userAccountRepository = userAccountRepository;

  Future<AuthResponse> login(LoginInput loginInput) async {
    try {
      var response = await _dioClient.post(Endpoints.login, data: loginInput.toFormData());
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      UserModel userModel = authResponse.data;
      await _userAccountRepository.saveUserInDb(userModel);
      await _sessionRepository.setToken(authResponse.token);
      _dioClient.setToken(authResponse.token);
      await _sessionRepository.setLoggedIn(true);
      return authResponse;
    } on DioException catch (e, stackTrace) {
      _log.e(e, stackTrace: stackTrace);
      throw ApiError.fromDioException(e);
    } on TypeError catch (e, stackTrace) {
      _log.e(stackTrace);
      throw ApiError(message: '$e', code: 0);
    } catch (e) {
      _log.e(e);
      throw ApiError(message: '$e', code: 0);
    }
  }

  Future<AuthResponse> signup(SignupInput signupInput) async {
    try {
      var response = await _dioClient.post(Endpoints.signup, data: signupInput.toFormData());
      if (response.data['result'] == ApiResult.success) {
        AuthResponse authResponse = AuthResponse.fromJson(response.data);
        UserModel userModel = authResponse.data;
        await _userAccountRepository.saveUserInDb(userModel);
        await _sessionRepository.setToken(authResponse.token);
        _dioClient.setToken(authResponse.token);
        await _sessionRepository.setLoggedIn(true);
        return authResponse;
      }
      throw response.data['message'];
    } on DioException catch (e, stackTrace) {
      _log.e(e, stackTrace: stackTrace);
      throw ApiError.fromDioException(e);
    } on TypeError catch (e) {
      _log.e(e.stackTrace);
      throw ApiError(message: '$e', code: 0);
    } catch (e) {
      _log.e(e);
      throw ApiError(message: '$e', code: 0);
    }
  }
}
