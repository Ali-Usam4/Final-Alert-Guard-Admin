import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  final String hint;
  final List<String> items;
  final bool disable;
  final Color borderColor;
  final Color hintColor;
  final Color fillColor;
  final Color iconColor;
  final bool isOutline;
  final String? suffixIconPath;
  final double allPadding;
  final double verticalPadding;
  final double horizontalPadding;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? width;
  final double borderRadius;
  final Function(String value)? onSelect;
  final String? dropdownValue;

  const CustomDropDown({
    super.key,
    required this.hint,
    required this.items,
    this.hintColor = Colors.white,
    this.suffixIconPath,
    this.disable = false,
    this.borderColor = AppColors.primary,
    this.fontSize = 16,
    this.onSelect,
    this.isOutline = true,
    this.allPadding = 10,
    this.fontWeight = FontWeight.w400,
    this.horizontalPadding = 16,
    this.verticalPadding = 14,
    this.width,
    this.fillColor = AppColors.secondary,
    this.iconColor = Colors.white,
    this.borderRadius = 8,
    this.dropdownValue,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        child: DropdownButtonFormField(
          isExpanded: true,
          isDense: true,
          icon: SvgPicture.asset(
            'assets/icons/svg/ic_dropdown.svg',
            color: widget.iconColor,
          ),
          style: TextStyle(color: widget.hintColor, fontWeight: widget.fontWeight, fontSize: widget.fontSize),
          hint: Text(
            widget.hint,
            style: TextStyle(color: widget.hintColor, fontWeight: widget.fontWeight, fontSize: widget.fontSize),
            overflow: TextOverflow.ellipsis,
          ),
          decoration: InputDecoration(
              enabled: true,
              filled: true,
              fillColor: widget.fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding)),
          dropdownColor: AppColors.secondary,
          value: widget.dropdownValue,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          onChanged: (String? newValue) {
            if (widget.onSelect != null) {
              widget.onSelect!(newValue!);
            }
          },
          menuMaxHeight: 550,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                overflow: TextOverflow.ellipsis,
                value,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.hintColor,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
