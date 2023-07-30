import 'package:flutter/material.dart';

import '/core/global/app_colors.dart';
import '/core/utils/size_config.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.iconColor,
    required this.iconSize,
    this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final void Function() onTap;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? SizeConfig.screenHeight! * 0.04,
      width: width ?? SizeConfig.screenHeight! * 0.04,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: AppColors.kShadowColor,
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.kGraySplashColor,
          onTap: onTap,
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
