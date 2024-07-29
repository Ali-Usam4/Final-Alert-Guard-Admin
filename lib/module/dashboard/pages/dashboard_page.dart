import 'dart:math';

import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/constants/asset_paths.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/card_widget.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/company_input_fields.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/user_input_fields.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/ui/widgets/primary_button.dart';
import 'package:final_alert_guard_admin/utils/display/display_utils.dart';
import 'package:final_alert_guard_admin/utils/extensions/context_user.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/pin_types.dart';
import '../../../core/di/service_locator.dart';
import '../cubit/create_pin_cubit.dart';
import '../model/pin_model.dart';
import '../widgets/custom_bar_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePinCubit(
        sl(),
      ),
      child: const DashboardPageView(),
    );
  }
}

class DashboardPageView extends StatefulWidget {
  const DashboardPageView({super.key});

  @override
  State<DashboardPageView> createState() => _DashboardPageViewState();
}

class _DashboardPageViewState extends State<DashboardPageView> {
  PinType selectedPinType = PinType.company;
  String _randomPin = '';

  bool _createPin = false;

  final _formKey = GlobalKey<FormState>();

  final _companyNameController = TextEditingController();
  final _managerNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _additionalInfoController = TextEditingController();

  @override
  void initState() {
    _regenerateText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watchCurrentUser;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BaseScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      onPressed: () {
                        setState(() {
                          _createPin = !_createPin;
                        });
                      },
                      title: "Create Pin",
                      prefixIconPath: 'assets/icons/ic_plus.svg',
                      width: 180,
                    ),
                  ),
                  if (_createPin) ...[
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
                  ]
                ],
              ),
              if (_createPin) ...[
                const SizedBox(
                  height: 40,
                ),
                if (selectedPinType == PinType.company) ...[
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.2),
                    child: CompanyInputFields(
                      companyNameController: _companyNameController,
                      managerNameController: _managerNameController,
                      phoneNumberController: _phoneController,
                      addressController: _addressController,
                      cityController: _cityController,
                      stateController: _stateController,
                      additionalInfoController: _additionalInfoController,
                    ),
                  ),
                ] else if (selectedPinType == PinType.users) ...[
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.2),
                    child: UserInputFields(
                      userNameController: _nameController,
                      phoneNumberController: _phoneController,
                      addressController: _additionalInfoController,
                      cityController: _cityController,
                      stateController: _stateController,
                    ),
                  ),
                ],
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
                            _randomPin,
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
                BlocConsumer<CreatePinCubit, CreatePinState>(
                  listener: (context, state) {
                    if (state.status == CreatePinStatus.loading) {
                      DisplayUtils.showLoader();
                    } else if (state.status == CreatePinStatus.success) {
                      DisplayUtils.removeLoader();
                      DisplayUtils.showSnackBar(context, 'Pin created successfully');
                    } else if (state.status == CreatePinStatus.failure) {
                      DisplayUtils.removeLoader();
                      DisplayUtils.showSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      onPressed: _submit,
                      title: 'Save',
                      width: 160,
                    );
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (selectedPinType == PinType.company) {
        CompanyPinModel companyPin = CompanyPinModel(
          companyName: _companyNameController.text,
          managerName: _managerNameController.text,
          phone: _phoneController.text,
          address: _addressController.text,
          city: _cityController.text,
          state: _stateController.text,
          additionalInfo: _additionalInfoController.text,
          pin: _randomPin,
          dateTime: DateTime.now(),
        );
        context.read<CreatePinCubit>().createCompanyPin(companyPin);
      } else if (selectedPinType == PinType.users) {
        UserPinModel userPin = UserPinModel(
          name: _nameController.text,
          phone: _phoneController.text,
          address: _addressController.text,
          city: _cityController.text,
          state: _stateController.text,
          pin: _randomPin,
          dateTime: DateTime.now(),
        );
        context.read<CreatePinCubit>().createUserPin(userPin);
      }
    }
  }

  void _regenerateText() {
    setState(() {
      _randomPin = _generateRandomText(10); // Change to your desired length
    });
  }

  String _generateRandomText(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _randomPin));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Copied to clipboard',
          textAlign: TextAlign.center,
        ),
        width: 260,
        showCloseIcon: true,
      ),
    );
  }
}
