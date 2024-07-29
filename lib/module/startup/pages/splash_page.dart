import 'package:final_alert_guard_admin/module/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/nav_router.dart';
import '../../../constants/asset_paths.dart';
import '../../../core/di/service_locator.dart';
import '../../authentication/pages/login_page.dart';
import '../../user/cubits/user_cubit.dart';
import '../cubit/startup_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit(
        dioClient: sl(),
        sessionRepository: sl(),
      )..init(),
      child: BlocListener<StartupCubit, StartupState>(
        listener: (context, state) {
          if (state.status == Status.authenticated) {
            context.read<UserCubit>().loadUser();
            NavRouter.pushAndRemoveUntil(context, const HomePage());
          } else if (state.status == Status.unauthenticated) {
            NavRouter.pushAndRemoveUntil(context, const LoginPage());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(height: 200, width: 200, child: Image.asset(AssetPaths.logo)),
          ),
        ),
      ),
    );
  }
}
