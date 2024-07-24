import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
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
      ],
      child: child,
    );
  }
}
