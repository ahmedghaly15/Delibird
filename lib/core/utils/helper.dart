import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

import '../models/user_model.dart';

enum SnackBarStates { success, error }

class Helper {
  static String? uId;

  static UserModel? model;

  static void buildSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required SnackBarStates state,
  }) {
    Get.snackbar(
      "",
      "",
      titleText: Text(
        title,
        style: AppTextStyles.snackBarTitleTextStyle,
      ),
      messageText: Text(
        message,
        style: AppTextStyles.snackBarTitleTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      icon: state == SnackBarStates.error
          ? const Icon(
              Icons.warning_rounded,
              color: Colors.white,
              size: 35,
            )
          : const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 35,
            ),
      shouldIconPulse: state == SnackBarStates.error ? true : false,
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 22.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 32.0,
      ),
      borderRadius: 16.0,
      backgroundColor: chooseSnackBarClr(state),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: const Offset(2, 5),
          blurRadius: 20,
          spreadRadius: 5,
        ),
      ],
      forwardAnimationCurve: Curves.easeInBack,
      reverseAnimationCurve: Curves.easeOutBack,
      animationDuration: const Duration(milliseconds: 400),
    );
  }

  static Color chooseSnackBarClr(SnackBarStates state) {
    Color color;
    switch (state) {
      case SnackBarStates.success:
        color = Colors.green;
        break;
      case SnackBarStates.error:
        color = Colors.red;
        break;
    }
    return color;
  }
}
