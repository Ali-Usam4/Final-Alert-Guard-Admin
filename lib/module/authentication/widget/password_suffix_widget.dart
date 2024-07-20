import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordSuffixIcon extends StatelessWidget {
  const PasswordSuffixIcon({
    super.key,
    required this.isPasswordVisible,
    required this.onTap,
  });

  final bool isPasswordVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashRadius: 20,
      icon: isPasswordVisible ? SvgPicture.asset('assets/icons/ic_show_password.svg') : SvgPicture.asset('assets/icons/ic_hide_password.svg'),
    );
  }
}
