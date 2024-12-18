import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';
import '../../module/authentication/widget/password_suffix_widget.dart';
import '../../utils/validators/validators.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.label,
    required this.title,
    this.isRequired = true,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.maxLines = 1,
    this.fillColor,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.autoFocus = false,
    super.key,
    this.onChange,
    this.borderColor = AppColors.lightGrey,
    this.borderRadius = 8,
    this.fontSize = 24,
    this.boxConstraints = 44,
    this.fontWeight = FontWeight.w400,
    this.horizontalPadding = 20,
    this.verticalPadding = 16,
    this.suffixIconTopPadding = 16,
    this.suffixIconRightPadding = 16,
  });

  final TextEditingController controller;
  final String label;
  final String title;
  final bool isRequired;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool autoFocus;
  final Function(String)? onChange;
  final Color? borderColor;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double boxConstraints;
  final double suffixIconTopPadding;
  final double suffixIconRightPadding;
  final FontWeight fontWeight;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    final validator = widget.validator ?? Validators.getValidator(widget.keyboardType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: 12,
              ),
            ),
            if (widget.isRequired)
              Text(
                " *",
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.red,
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              obscureText: widget.obscureText,
              validator: validator,
              enabled: true,
              onTap: widget.onTap,
              autofocus: widget.autoFocus,
              readOnly: widget.readOnly,
              inputFormatters: widget.inputFormatters,
              onFieldSubmitted: widget.onFieldSubmitted,
              maxLines: widget.maxLines,
              onChanged: widget.onChange,
              style: context.textTheme.titleSmall,
              decoration: InputDecoration(
                hintText: widget.label,
                hintStyle: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                ),
                filled: true,
                fillColor: widget.fillColor ?? Colors.transparent,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding,
                  vertical: widget.verticalPadding,
                ),
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: BoxConstraints(
                  maxWidth: widget.boxConstraints,
                  maxHeight: widget.boxConstraints,
                ),
                hoverColor: Colors.transparent,
                suffix: widget.suffix,
              ),
            ),
            Positioned(
              right: widget.suffixIcon is IconButton || widget.suffixIcon is PasswordSuffixIcon ? 6 : widget.suffixIconRightPadding,
              top: widget.suffixIcon is IconButton || widget.suffixIcon is PasswordSuffixIcon ? 2 : widget.suffixIconTopPadding,
              child: Align(
                alignment: Alignment.centerRight,
                child: widget.suffixIcon,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
