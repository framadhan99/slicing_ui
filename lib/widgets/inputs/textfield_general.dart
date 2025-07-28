import 'package:flutter/material.dart';
import 'package:slicing_ui/app/config/asset_colors.dart';
import 'package:slicing_ui/app/config/asset_styles.dart';

class TextFieldGeneral extends StatelessWidget {
  const TextFieldGeneral({
    Key? key,
    required this.hintText,
    this.obscureText,
    this.hintStyle,
    this.style,
    this.readOnly = false,
    this.border = true,
    this.borderRadius = 8,
    this.contentPadding,
    this.controller,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.minLines,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final String hintText;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool readOnly;
  final bool border;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      obscureText: obscureText ?? false,
      style: style ?? AssetStyles.textRegular.copyWith(fontSize: 14),
      textAlign: textAlign,
      minLines: minLines,
      maxLines: minLines == null ? null : minLines! * 2,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        isCollapsed: true,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AssetStyles.textRegular.copyWith(
              color: AssetColors.secondColor.withAlpha(100),
              fontSize: 14,
            ),
        enabledBorder: border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: AssetColors.secondColor.withAlpha(100),
                  width: 1,
                ),
              )
            : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: AssetColors.primaryColor,
                  width: 1,
                ),
              )
            : const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
