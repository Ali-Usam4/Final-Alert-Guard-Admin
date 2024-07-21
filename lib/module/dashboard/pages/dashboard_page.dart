import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/module/dashboard/widgets/card_widget.dart';
import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:final_alert_guard_admin/ui/widgets/primary_button.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              height: 220,
              child: Row(
                children: [
                  const Expanded(child: CustomBarChart()),
                  const SizedBox(
                    width: 50,
                  ),
                  CardWidget(
                    title: 'Registered Company',
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

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
  bool isMonthly = true;
  DateTimeRange? selectedDateRange;
  String selectedType = 'Company';

  final List<int> userCountsMonthly = [
    400,
    300,
    500,
    450,
    600,
    700,
    550,
    400,
    650,
    300,
    600,
  ];

  final List<int> userCounts6Months = [
    2500,
    2600,
    2700,
    2800,
    2900,
    3000,
    3100,
    3200,
    3300,
    3400,
    3500,
    3600,
    3700,
    3800,
    3900,
    4000,
    4100,
    4200,
    4300,
    4400,
    4500,
    4600,
    4700,
    4800,
    4900,
    5000,
    5100,
    5200,
    5300,
    5400,
    5500,
    5600,
    5700,
    5800,
    5900,
    6000,
  ];

  List<int> get userCounts => isMonthly ? userCountsMonthly : userCounts6Months;

  List<String> get xAxisLabels {
    if (selectedDateRange != null) {
      final days = selectedDateRange!.end.difference(selectedDateRange!.start).inDays;
      return List.generate(days + 1, (index) {
        return DateFormat('d').format(selectedDateRange!.start.add(Duration(days: index)));
      });
    } else if (isMonthly) {
      return List.generate(userCountsMonthly.length > 20 ? 20 : userCountsMonthly.length, (index) {
        return DateFormat('d').format(DateTime.now().subtract(Duration(days: userCountsMonthly.length - index)));
      });
    } else {
      return List.generate(userCounts6Months.length, (index) {
        return DateFormat('d').format(DateTime.now().subtract(Duration(days: userCounts6Months.length - index)));
      });
    }
  }

  String get dateRangeText {
    if (selectedDateRange == null) {
      return isMonthly ? '28 Dec 22 - 10 Jan 23' : '28 Dec 22 - 10 Jun 23';
    }
    return '${DateFormat('dd MMM yy').format(selectedDateRange!.start)} - ${DateFormat('dd MMM yy').format(selectedDateRange!.end)}';
  }

  // void _selectDateRange() async {
  //   final double height = MediaQuery.of(context).size.height;
  //   DateTimeRange? picked = await showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       child: Container(
  //         padding: const EdgeInsets.all(16.0),
  //         //height: height * 0.4,
  //         child: Column(
  //           children: [
  //             Text('Select Date Range', style: context.textTheme.titleLarge),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               height: height * 0.2,
  //               width: 400,
  //               child: DateRangePicker(
  //                 onDateRangeSelected: (range) {
  //                   Navigator.pop(context, range);
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //   if (picked != null && picked != selectedDateRange) {
  //     setState(() {
  //       selectedDateRange = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: selectedType,
                  items: ['Company', 'Users'].map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: context.textTheme.titleSmall,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                ToggleButtons(
                  isSelected: [isMonthly, !isMonthly],
                  onPressed: (index) {
                    setState(() {
                      isMonthly = index == 0;
                    });
                  },
                  children: const [Text('Month'), Text('6 Month')],
                ),
                InkWell(
                  onTap: () {
                    showDateRangePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2035));
                  },
                  child: Text(
                    dateRangeText,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  //alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: userCounts.asMap().entries.map((entry) {
                    int index = entry.key;
                    int value = entry.value;
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          fromY: 0,
                          color: Colors.green,
                          width: 6,
                          toY: value.toDouble(),
                        )
                      ],
                    );
                  }).toList(),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= xAxisLabels.length) return const SizedBox.shrink();
                          if ((isMonthly && index % 2 == 0) || (!isMonthly && index % 10 == 0)) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(xAxisLabels[index]),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      // tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY.toInt()} Users',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    handleBuiltInTouches: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateRangePicker extends StatefulWidget {
  final void Function(DateTimeRange) onDateRangeSelected;

  const DateRangePicker({required this.onDateRangeSelected});

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange? selectedRange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker(
          initialDate: selectedRange?.start ?? DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2035),
          onDateChanged: (date) {
            if (selectedRange == null) {
              setState(() {
                selectedRange = DateTimeRange(start: date, end: date);
              });
            } else {
              if (date.isBefore(selectedRange!.start)) {
                setState(() {
                  selectedRange = DateTimeRange(start: date, end: selectedRange!.end);
                });
              } else {
                setState(() {
                  selectedRange = DateTimeRange(start: selectedRange!.start, end: date);
                });
              }
            }
          },
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedRange != null) {
              widget.onDateRangeSelected(selectedRange!);
            }
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
