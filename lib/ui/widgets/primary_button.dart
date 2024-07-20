import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.hMargin = 0,
    this.height = 46,
    this.width = double.infinity,
    this.backgroundColor,
    this.titleColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 13,
    this.fontWidget,
    this.borderRadius = 10,
  });

  final String title;
  final VoidCallback onPressed;
  final double hMargin;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? titleColor;
  final double borderRadius;
  final Color borderColor;
  final FontWeight fontWeight;
  final double fontSize;
  final Widget? fontWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: hMargin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor ?? context.colorScheme.primary,
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: fontWeight,
              color: titleColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.hMargin = 0,
    this.height = 50,
    this.width = double.infinity,
    this.backgroundColor,
    this.titleColor = Colors.white,
    this.borderColor = AppColors.secondary,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 24,
    this.fontWidget,
    this.borderRadius = 8,
  });

  final String title;
  final VoidCallback onPressed;
  final double hMargin;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? titleColor;
  final double borderRadius;
  final Color borderColor;
  final FontWeight fontWeight;
  final double? fontSize;
  final Widget? fontWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: hMargin),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderColor,
              )),
          backgroundColor: backgroundColor ?? Colors.transparent,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: fontWeight,
                  color: titleColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
