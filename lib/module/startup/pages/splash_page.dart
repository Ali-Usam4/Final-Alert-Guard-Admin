import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes/nav_router.dart';
import '../../../constants/asset_paths.dart';
import '../../../core/di/service_locator.dart';
import '../../../ui/widgets/base_scaffold.dart';
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
            NavRouter.pushAndRemoveUntil(context, const LoginPage());
          } else if (state.status == Status.unauthenticated) {
            //NavRouter.pushAndRemoveUntil(context, const StartupPage());
          }
        },
        child: BaseScaffold(
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56.0),
                  child: SvgPicture.asset(AssetPaths.svgLogo),
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Text('Splash Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
