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
    this.focusNode,
    this.hintStyle = AppTextStyles.hintStyle,
    this.obscure,
    this.validating,
    this.onSubmit,
    this.onEditingComplete,
  }) : super(key: key);

  final FocusNode? focusNode;
  final String hint;
  final TextStyle? hintStyle;
  final bool? obscure;

  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validating;
  final TextInputType keyboardType;
  final void Function(String)? onSubmit;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.05,
      width: SizeConfig.screenWidth! * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
          hintText: hint,
          hintStyle: hintStyle,
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: buildOutlineInputBorder(Colors.white, 0),
          focusedBorder: buildOutlineInputBorder(AppColors.kPrimaryColor, 2),
          errorBorder: buildOutlineInputBorder(Colors.red, 2),
        ),
        style: AppTextStyles.hintStyle.copyWith(
          color: Colors.black,
          fontSize: 14,
        ),
        cursorColor: AppColors.kPrimaryColor,
        obscureText: obscure ?? false,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        validator: validating,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
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
