import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/global/app_assets.dart';
import '/core/global/app_colors.dart';
import '/core/global/app_navigator.dart';
import '/core/network/local/cache_helper.dart';
import '/core/utils/helper.dart';
import '/core/utils/size_config.dart';
import '/core/utils/splash_controller.dart';
import '/features/auth/presentation/views/log_in_view.dart';
import '/features/home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();

    moveToTheNextView();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => const SplashViewBody());

    splashController.startAnimation();

    return Stack(
      children: [
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1700),
            right: splashController.animate.value ? -170 : 0,
            // right: ,
            bottom: splashController.animate.value ? 170 : 0,
            // bottom: -10,
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
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          top: 0,
          child: Center(
            child: Image.asset(
              AppAssets.appIcon,
              fit: BoxFit.cover,
              width: SizeConfig.screenWidth! * 0.5,
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1700),

            left: splashController.animate.value ? -170 : 0,
            // right: ,
            top: splashController.animate.value ? 170 : 0,
            // bottom: -10,
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
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1700),
            left: splashController.animate.value ? -170 : 0,
            // top: 0,
            bottom: splashController.animate.value ? -20 : -80,
            child: Container(
              height: SizeConfig.screenWidth! * 0.7,
              width: SizeConfig.screenWidth! * 0.6,
              decoration: const BoxDecoration(
                color: AppColors.kLightBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1700),
            right: splashController.animate.value ? -170 : 0,
            // top: 0,
            top: splashController.animate.value ? -20 : -80,
            child: Container(
              height: SizeConfig.screenWidth! * 0.7,
              width: SizeConfig.screenWidth! * 0.6,
              decoration: const BoxDecoration(
                color: AppColors.kLightBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void moveToTheNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Helper.uId = CacheHelper.getStringData(key: 'uId');

      if (Helper.uId != null) {
        AppNavigator.navigateAndFinishAll(screen: const HomeView());
      } else {
        AppNavigator.navigateAndFinish(screen: const LoginView());
      }
    });
  }
}
