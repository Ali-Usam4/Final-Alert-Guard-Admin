import 'dart:math';

import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/constants/asset_paths.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/card_widget.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/company_input_fields.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/user_input_fields.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/ui/widgets/primary_button.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  String _randomText = '';

  @override
  void initState() {
    _regenerateText();
    super.initState();
  }

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
                    numbers: '21',
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
                    width: 180,
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
                    width: 140,
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
                    width: 140,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.2),
              child: selectedPinType == PinType.company ? const CompanyInputFields() : const UserInputFields(),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4) + const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.lightGrey),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _randomText,
                        style: context.textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      IconButton(
                        icon: SvgPicture.asset(AssetPaths.ic_copy),
                        onPressed: _copyToClipboard,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  'Send:',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: SvgPicture.asset(AssetPaths.ic_whatsapp),
                  onPressed: () {
                    // Handle WhatsApp action here
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(AssetPaths.ic_twitter),
                  onPressed: () {
                    // Handle Twitter action here
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(AssetPaths.ic_skype),
                  onPressed: () {
                    // Handle Skype action here
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.sync,
                  size: 24,
                  color: AppColors.primary,
                ),
                const SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: _regenerateText,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(2),
                    minimumSize: const Size(0, 0),
                    overlayColor: Colors.transparent,
                  ),
                  child: Text(
                    'Regenerate',
                    style: context.textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(
              onPressed: () {},
              title: 'Save',
              width: 160,
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  void _regenerateText() {
    setState(() {
      _randomText = _generateRandomText(10); // Change to your desired length
    });
  }

  String _generateRandomText(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _randomText));
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Copied to clipboard')),
    // );
  }
}
