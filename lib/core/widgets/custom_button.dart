import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';
import 'package:nexo_app/core/utils/helper.dart';

import '/core/global/app_text_styles.dart';
import '/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.hasIcon,
    required this.text,
    this.textStyle = AppTextStyles.buttonStyle,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? radius;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppColors.kButtonSplashColor,
        borderRadius: BorderRadius.circular(radius ?? 50.0),
        onTap: onPressed,
        child: Container(
          height: height ?? SizeConfig.screenHeight! * 0.048,
          width: width ?? SizeConfig.screenWidth! * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50.0),
            gradient: Helper.primaryColorLinearGradient(),
          ),
          child: hasIcon
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 25,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(text, style: textStyle),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text(text, style: textStyle),
                ),
        ),
      ),
    );
  }
}
