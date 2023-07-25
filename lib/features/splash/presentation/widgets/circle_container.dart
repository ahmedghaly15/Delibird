import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/splash_controller.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key? key,
    required this.splashController,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final SplashController splashController;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1700),
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        height: SizeConfig.screenWidth! * 0.7,
        width: SizeConfig.screenWidth! * 0.6,
        decoration: const BoxDecoration(
          color: AppColors.kLightBlue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
