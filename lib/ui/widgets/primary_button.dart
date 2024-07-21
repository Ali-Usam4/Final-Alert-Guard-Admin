import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

class PrefixIconButton extends StatelessWidget {
  const PrefixIconButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height = 46,
      this.backgroundColor = AppColors.primary,
      this.titleColor = Colors.white,
      this.fontSize = 13,
      this.prefixIconPath,
      this.hPadding = 12,
      this.borderColor,
      this.prefixIconSize = 16,
      this.borderRadius = 10,
      this.foregroundColor,
      this.width,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.titleGap = 14});

  final String title;
  final VoidCallback onPressed;
  final double? fontSize;
  final double height;
  final double? width;
  final Color backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final String? prefixIconPath;
  final double prefixIconSize;
  final double hPadding;
  final Color titleColor;
  final MainAxisAlignment mainAxisAlignment;
  final Color? borderColor;
  final double titleGap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor != null ? borderColor! : context.colorScheme.outline, width: .5)),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            SvgPicture.asset(
              height: prefixIconSize,
              prefixIconPath!,
            ),
            SizedBox(
              width: titleGap,
            ),
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: fontSize, color: titleColor),
            )
          ],
        ),
      ),
    );
  }
}

class SuffixIconButton extends StatelessWidget {
  const SuffixIconButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height = 44,
      this.backgroundColor = Colors.white,
      this.titleColor = Colors.white,
      this.borderColor,
      this.foregroundColor,
      this.fontSize = 16,
      this.suffixIconSize = 18,
      this.hPadding = 12,
      this.suffixIconPath,
      this.borderRadius = 10,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.titleGap = 14});

  final String title;
  final VoidCallback onPressed;
  final double? fontSize;
  final double height;
  final Color backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color titleColor;
  final double borderRadius;
  final double suffixIconSize;
  final double hPadding;
  final String? suffixIconPath;
  final MainAxisAlignment mainAxisAlignment;
  final double titleGap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor != null ? borderColor! : context.colorScheme.outline, width: .5)),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: fontSize, color: titleColor),
            ),
            SizedBox(
              width: titleGap,
            ),
            SvgPicture.asset(
              height: suffixIconSize,
              suffixIconPath!,
            ),
          ],
        ),
      ),
    );
  }
}
