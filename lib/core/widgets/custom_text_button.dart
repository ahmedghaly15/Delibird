import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle = AppTextStyles.textButtonStyle,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColors.kButtonSplashColor.withOpacity(0.2),
        onTap: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
