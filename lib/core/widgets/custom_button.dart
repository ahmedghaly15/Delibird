import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';

import '/core/global/app_text_styles.dart';
import '/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle = AppTextStyles.buttonStyle,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColors.kButtonSplashColor,
        borderRadius: BorderRadius.circular(50.0),
        onTap: onPressed,
        child: Container(
          height: SizeConfig.screenHeight! * 0.048,
          width: SizeConfig.screenWidth! * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF0062BD),
                const Color(0xFF0062BD).withOpacity(0.5),
                const Color(0xFF0062BD).withOpacity(0.27),
              ],
            ),
          ),
          child: Center(
            child: Text(text, style: textStyle),
          ),
        ),
      ),
    );
  }
}
