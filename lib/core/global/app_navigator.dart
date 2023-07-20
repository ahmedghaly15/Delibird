import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  static void navigateTo({
    required Widget screen,
    Transition? transition,
  }) {
    Get.to(
      () => screen,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  static void getBack() {
    Get.back();
  }

  static void navigateAndFinish({
    required Widget screen,
    Transition? transition,
  }) {
    Get.off(
      () => screen,
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  static void navigateAndFinishAll({
    required Widget screen,
    Transition? transition,
  }) {
    Get.offAll(
      () => screen,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}
