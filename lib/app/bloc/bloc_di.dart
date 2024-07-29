import 'package:final_alert_guard_admin/module/authentication/cubit/login/login_cubit.dart';
import 'package:final_alert_guard_admin/module/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import '../../module/user/cubits/user_cubit.dart';
import '../cubit/app_cubit.dart';

class BlocDI extends StatelessWidget {
  const BlocDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(sl())..init(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(authRepository: sl()),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(userAccountRepository: sl()),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: child,
    );
  }
}
