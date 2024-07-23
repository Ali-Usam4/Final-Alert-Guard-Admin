import 'package:final_alert_guard_admin/constants/app_colors.dart';
import 'package:final_alert_guard_admin/utils/display/pickers.dart';
import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                  underline: Container(),
                  icon: const Icon(Icons.keyboard_arrow_down),
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
                  onTap: () async {
                    DateTimeRange? dateTimeRange = await Pickers.pickDateRange(context);
                    if (dateTimeRange != null) {
                      print(dateTimeRange);
                    }
                  },
                  child: Expanded(
                    child: Text(
                      dateRangeText,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(
              thickness: 2,
              color: AppColors.lightGrey,
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
