import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bloc/app_bloc_observer.dart';
import 'app/my_app.dart';
import 'config/environment.dart';
import 'core/initializer/init_app.dart';
import 'core/network/my_http_overrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HttpOverrides.global = MyHttpOverrides();

  /// =============== App initialization ==================
  await initFirebase();
  await initApp(Environment.fromEnv(AppEnv.dev));
  runApp(const FinalAlertGuardWeb());
}
