import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/environment.dart';
import '../../module/authentication/repository/auth_repository.dart';
import '../../module/authentication/repository/session_repository.dart';
import '../../module/dashboard/repository/create_pin_repository.dart';
import '../../module/user/repository/user_account_repository.dart';
import '../network/dio_client.dart';
import '../security/secured_auth_storage.dart';
import '../storage_service/storage_service.dart';

final sl = GetIt.instance;

void setupLocator(Environment environment) async {
  /// ==================== Environment =========================
  sl.registerLazySingleton<Environment>(() => environment);

  /// ==================== Shared Pref =========================
  sl.registerSingletonAsync<SharedPreferences>(() async => SharedPreferences.getInstance());

  /// ==================== DataBase ===========================
  sl.registerLazySingleton<AuthSecuredStorage>(() => AuthSecuredStorage());
  sl.registerSingletonWithDependencies<StorageService>(
    () => StorageService(sharedPreferences: sl()),
    dependsOn: [SharedPreferences],
  );

  /// ==================== Networking ===========================
  sl.registerLazySingleton<DioClient>(() => DioClient(environment: sl()));

  /// ==================== Modules ===========================

  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepository(
      storageService: sl<StorageService>(),
      authSecuredStorage: sl<AuthSecuredStorage>(),
    ),
  );

  sl.registerLazySingleton<UserAccountRepository>(
    () => UserAccountRepository(storageService: sl<StorageService>(), sessionRepository: sl<SessionRepository>(), dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      sessionRepository: sl(),
      userAccountRepository: sl(),
      firestore: FirebaseFirestore.instance,
    ),
  );

  sl.registerLazySingleton<CreatePinRepository>(
    () => CreatePinRepository(
      firestore: FirebaseFirestore.instance,
    ),
  );
}
