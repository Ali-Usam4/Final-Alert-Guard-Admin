import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/module/users/pages/users_page.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/asset_paths.dart';
import '../../company/pages/company_page.dart';
import '../../dashboard/pages/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const CompanyPage(),
    const UsersPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BaseScaffold(
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
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onItemTapped(0),
                  iconPath: AssetPaths.ic_dashboard,
                  title: "Dashboard",
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                HomeMenuTile(
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onItemTapped(1),
                  iconPath: AssetPaths.ic_company,
                  title: "Company",
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                HomeMenuTile(
                  isSelected: _selectedIndex == 2,
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
          child: _pages[_selectedIndex],
        ),
      ],
    ));
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
