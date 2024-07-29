import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/module/authentication/cubit/login/login_cubit.dart';
import 'package:final_alert_guard_admin/module/home/cubit/home_cubit.dart';
import 'package:final_alert_guard_admin/module/users/pages/users_page.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/utils/extensions/context_user.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/asset_paths.dart';
import '../../../ui/widgets/toast_loader.dart';
import '../../company/pages/company_page.dart';
import '../../dashboard/pages/dashboard_page.dart';
import '../../user/cubits/user_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const DashboardPage(),
    const CompanyPage(),
    const UsersPage(),
  ];

  void _onItemTapped(int index) {
    context.read<HomeCubit>().changeIndex(index);
  }

  @override
  void initState() {
    context.read<HomeCubit>().setInitialIndex(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watchCurrentUser;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, int>(
      builder: (context, selectedIndex) {
        return BaseScaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                SizedBox(
                  width: width * 0.16,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.transparent,
                      hintStyle: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.lightGrey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.lightGrey,
                      ),
                      hintText: 'Try searching',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 44,
                  padding: const EdgeInsets.fromLTRB(8, 5, 4, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/images/profile.png',
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        user.isEditMode ? "ADMIN" : 'View\nOnly',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, loginState) {
                          if (loginState.loginStatus == LoginStatus.loading) {
                            ToastLoader.show();
                          } else if (loginState.loginStatus == LoginStatus.success) {
                            context.read<UserCubit>().loadUser();
                            ToastLoader.remove();
                          } else if (loginState.loginStatus == LoginStatus.error) {
                            ToastLoader.remove();
                            context.showSnackBar(loginState.errorMessage);
                          }
                        },
                        builder: (context, loginState) {
                          return Switch(
                            value: user.isEditMode,
                            onChanged: (value) {
                              context.read<LoginCubit>().updateEditMode(value);
                            },
                            activeColor: Colors.white,
                            activeTrackColor: AppColors.primary,
                            inactiveTrackColor: AppColors.lightGrey,
                            inactiveThumbColor: AppColors.secondary,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.02) + EdgeInsets.only(left: width * 0.012),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AssetPaths.homeLogo,
                          height: height * 0.08,
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        HomeMenuTile(
                          isSelected: selectedIndex == 0,
                          onTap: () => _onItemTapped(0),
                          iconPath: AssetPaths.ic_dashboard,
                          title: "Dashboard",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        HomeMenuTile(
                          isSelected: selectedIndex == 1,
                          onTap: () => _onItemTapped(1),
                          iconPath: AssetPaths.ic_company,
                          title: "Company",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        HomeMenuTile(
                          isSelected: selectedIndex == 2,
                          onTap: () => _onItemTapped(2),
                          iconPath: AssetPaths.ic_users,
                          title: "Users",
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            AssetPaths.ic_logout,
                            // colorFilter: ColorFilter.mode(
                            //   isSelected ? Colors.red : AppColors.primary,
                            //   BlendMode.srcIn,
                            // ),
                          ),
                          title: Text(
                            'Log Out',
                            style: context.textTheme.titleSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {},
                          contentPadding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: _pages[selectedIndex],
                ),
              ],
            ));
      },
    );
  }
}

class HomeMenuTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeMenuTile({super.key, required this.isSelected, required this.onTap, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.secondary,
          ),
        ),
        selected: isSelected,
        onTap: onTap,
        selectedColor: Colors.white,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
