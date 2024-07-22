import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/card_widget.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/ui/widgets/primary_button.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bar_chart.dart';

enum PinType {
  company,
  users,
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isEditModeEnabled = true;
  PinType selectedPinType = PinType.company;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BaseScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
                        width: 4,
                      ),
                      Text(
                        "ADMIN",
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Switch(
                        value: isEditModeEnabled,
                        onChanged: (value) {
                          setState(() {
                            isEditModeEnabled = value;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveTrackColor: AppColors.secondary,
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 240,
              child: Row(
                children: [
                  const Expanded(
                    child: CustomBarChart(),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  CardWidget(
                    title: 'Registered\nCompany',
                    numbers: '2 459',
                    onAddTap: () {},
                    onViewTap: () {},
                    color: AppColors.primary,
                    darkColor: AppColors.primaryDark,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CardWidget(
                    title: 'Registered\nUsers',
                    numbers: '2 459',
                    onAddTap: () {},
                    onViewTap: () {},
                    color: AppColors.orange,
                    darkColor: AppColors.orangeDark,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                color: AppColors.lightGrey,
                thickness: 2,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: PrefixIconButton(
                    onPressed: () {},
                    title: "Create Pin",
                    prefixIconPath: 'assets/icons/ic_plus.svg',
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Flexible(
                  child: PrimaryButton(
                    onPressed: () {
                      setState(() {
                        selectedPinType = PinType.company;
                      });
                    },
                    title: "Company",
                    backgroundColor: selectedPinType == PinType.company ? AppColors.secondary : AppColors.lightGrey,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Flexible(
                  child: PrimaryButton(
                    onPressed: () {
                      setState(() {
                        selectedPinType = PinType.users;
                      });
                    },
                    title: "Users",
                    backgroundColor: selectedPinType == PinType.users ? AppColors.secondary : AppColors.lightGrey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
