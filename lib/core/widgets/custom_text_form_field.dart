import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';
import 'package:nexo_app/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.textCapitalization,
    required this.keyboardType,
    this.suffixIcon,
    this.focusNode,
    this.hintStyle = AppTextStyles.hintStyle,
    this.obscure,
    this.validating,
    this.onSubmit,
    this.onEditingComplete,
    this.onChanged,
    this.prefixIcon,
    this.height,
    this.width,
    this.contentPadding,
    this.boxShadow,
  }) : super(key: key);

  final FocusNode? focusNode;
  final String hint;
  final TextStyle? hintStyle;
  final bool? obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validating;
  final TextInputType keyboardType;
  final void Function(String)? onSubmit;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? SizeConfig.screenHeight! * 0.05,
      width: width ?? SizeConfig.screenWidth! * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          boxShadow ??
              BoxShadow(
                color: AppColors.kShadowColor,
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(8, 4),
              ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.kPrimaryColor,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: hintStyle,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabledBorder: buildOutlineInputBorder(Colors.white, 0),
          focusedBorder: buildOutlineInputBorder(AppColors.kPrimaryColor, 2),
          errorBorder: buildOutlineInputBorder(Colors.white, 0),
          border: InputBorder.none,
        ),
        style: AppTextStyles.hintStyle.copyWith(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        cursorColor: AppColors.kPrimaryColor,
        obscureText: obscure ?? false,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        validator: validating,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color, double width) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
