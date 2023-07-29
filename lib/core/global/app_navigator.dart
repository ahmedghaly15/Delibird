import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  static void navigateTo({
    required Widget Function() screen,
    Transition? transition = Transition.rightToLeft,
    Duration? duration = const Duration(milliseconds: 400),
    Curve? curve = Curves.fastEaseInToSlowEaseOut,
    dynamic arguments,
  }) {
    Get.to(
      screen,
      transition: transition,
      duration: duration,
      curve: curve,
      arguments: arguments,
    );
  }

  static void getBack() {
    Get.back();
  }

  static void navigateAndFinish({
    required Widget Function() screen,
    Transition? transition = Transition.rightToLeftWithFade,
    Duration? duration = const Duration(milliseconds: 400),
    Curve? curve = Curves.fastEaseInToSlowEaseOut,
    dynamic arguments,
  }) {
    Get.off(
      screen,
      transition: transition,
      duration: duration,
      curve: curve,
      arguments: arguments,
    );
  }

  static void navigateAndFinishAll({
    required Widget Function() screen,
    Transition? transition = Transition.rightToLeft,
    Duration? duration = const Duration(milliseconds: 400),
    Curve? curve = Curves.fastEaseInToSlowEaseOut,
    dynamic arguments,
  }) {
    Get.offAll(
      screen,
      transition: transition,
      duration: duration,
      curve: curve,
      arguments: arguments,
    );
  }
}
