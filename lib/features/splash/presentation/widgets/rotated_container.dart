import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/splash_controller.dart';

class RotatedContainer extends StatelessWidget {
  const RotatedContainer({
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
      child: Transform.rotate(
        angle: 45 * (pi / -180),
        child: Container(
          height: SizeConfig.screenHeight! * 0.1,
          width: SizeConfig.screenWidth! * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.kDarkBlue,
          ),
        ),
      ),
    );
  }
}
