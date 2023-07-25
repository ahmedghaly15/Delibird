import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';
import 'package:nexo_app/core/utils/size_config.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.04,
      width: SizeConfig.screenHeight! * 0.04,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
            color: AppColors.kDefaultIconButtonColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}
