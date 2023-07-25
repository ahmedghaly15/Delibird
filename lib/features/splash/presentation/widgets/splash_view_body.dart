import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/global/app_assets.dart';
import '/core/global/app_navigator.dart';
import '/core/network/local/cache_helper.dart';
import '/core/utils/helper.dart';
import '/core/utils/size_config.dart';
import '/core/utils/splash_controller.dart';
import '/features/auth/presentation/views/log_in_view.dart';
import '/features/home/presentation/views/home_view.dart';
import 'circle_container.dart';
import 'rotated_container.dart';

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
  void dispose() {
    super.dispose();

    disposeSplashController();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => const SplashViewBody());

    splashController.startAnimation();

    return Stack(
      children: <Widget>[
        Obx(
          () => RotatedContainer(
            splashController: splashController,
            right: splashController.animate.value ? -170 : 0,
            bottom: splashController.animate.value ? 170 : 0,
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
          () => RotatedContainer(
            splashController: splashController,
            left: splashController.animate.value ? -170 : 0,
            top: splashController.animate.value ? 170 : 0,
          ),
        ),
        Obx(
          () => CircleContainer(
            splashController: splashController,
            left: splashController.animate.value ? -170 : 0,
            bottom: splashController.animate.value ? -20 : -80,
          ),
        ),
        Obx(
          () => CircleContainer(
            splashController: splashController,
            right: splashController.animate.value ? -170 : 0,
            top: splashController.animate.value ? -20 : -80,
          ),
        ),
      ],
    );
  }

  void moveToTheNextView() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      Helper.uId = CacheHelper.getStringData(key: 'uId');

      if (Helper.uId != null) {
        AppNavigator.navigateAndFinishAll(screen: () => const HomeView());
      } else {
        AppNavigator.navigateAndFinish(screen: () => const LoginView());
      }
    });
  }

  void disposeSplashController() {
    splashController.dispose();
  }
}
