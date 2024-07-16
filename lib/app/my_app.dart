import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import '../module/startup/pages/splash_page.dart';
import '../ui/widgets/unfocus.dart';
import 'bloc/bloc_di.dart';
import 'cubit/app_cubit.dart';

class OilChangeApp extends StatelessWidget {
  const OilChangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocDI(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: NavRouter.navigationKey,
            title: 'Oil Change',
            debugShowCheckedModeBanner: false,
            theme: darkTheme,
            themeMode: ThemeMode.light,
            builder: (BuildContext context, Widget? child) {
              child = BotToastInit()(context, child);
              child = UnFocus(child: child);
              return child;
            },
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}