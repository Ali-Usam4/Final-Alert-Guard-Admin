import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../ui/input/input_field.dart';
import '../../../../ui/widgets/base_scaffold.dart';
import '../../../../ui/widgets/toast_loader.dart';
import '../../../../utils/validators/validators.dart';
import '../../../ui/widgets/primary_button.dart';
import '../../user/cubits/user_cubit.dart';
import '../cubit/login/login_cubit.dart';
import '../models/login_input.dart';
import '../widget/password_suffix_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepository: sl()),
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.loginStatus == LoginStatus.loading) {
          ToastLoader.show();
        } else if (state.loginStatus == LoginStatus.success) {
          context.read<UserCubit>().loadUser();
          ToastLoader.remove();
          //NavRouter.pushAndRemoveUntil(context, const DashboardPage());
        } else if (state.loginStatus == LoginStatus.error) {
          ToastLoader.remove();
          context.showSnackBar(state.errorMessage);
        }
      },
      builder: (context, state) {
        return BaseScaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Form(
              key: _formKey,
              autovalidateMode: state.isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    controller: _emailController,
                    label: 'Email/Number',
                    textInputAction: TextInputAction.next,
                    validator: Validators.required,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    controller: _passwordController,
                    label: 'Password',
                    textInputAction: TextInputAction.done,
                    suffixIcon: PasswordSuffixIcon(
                      isPasswordVisible: !state.isPasswordHidden,
                      onTap: () {
                        context.read<LoginCubit>().toggleShowPassword();
                      },
                    ),
                    validator: (value) => Validators.password(
                      value,
                    ),
                    obscureText: state.isPasswordHidden,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryButton(
                    onPressed: _onLoggedIn,
                    title: 'Sign In',
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Don't have an account?",
                  //         style: context.textTheme.titleSmall),
                  //     IconButton(
                  //       onPressed: () {
                  //         NavRouter.push(context, const SignUpPage());
                  //       },
                  //       icon: Text(
                  //         'Create Account',
                  //         style: context.textTheme.titleSmall?.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           color: context.colorScheme.onPrimary,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onLoggedIn() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      LoginInput loginInput = LoginInput(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      //context.read<LoginCubit>().login(loginInput);
      //NavRouter.pushAndRemoveUntil(context, const DashboardPage());
    } else {
      context.read<LoginCubit>().enableAutoValidateMode();
    }
  }
}
