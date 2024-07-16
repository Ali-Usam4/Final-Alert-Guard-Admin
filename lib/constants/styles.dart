import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {

  static LinearGradient linearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryGreen, AppColors.primaryLighter],
  );

  static LinearGradient scaffoldVerticalGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: blackScaffoldGradientColors,
  );

  static const List<Color> blackScaffoldGradientColors = [
    Color(0xFF2D3036),
    Color(0xFF1A1B1F),
  ];
}
