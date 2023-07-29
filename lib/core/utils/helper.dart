import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

import '../global/app_colors.dart';
import '../models/user_model.dart';

enum SnackBarStates { success, error }

class Helper {
  static String? uId;

  static UserModel? model;

  static SystemUiOverlayStyle setTheSystemUIOverlayStyle({
    Color systemNavigationBarColor = Colors.transparent,
    Color statusBarColor = Colors.transparent,
    Brightness statusBarBrightness = Brightness.light,
  }) {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: systemNavigationBarColor,
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
    );
  }

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

  static void validatingPasswordField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Enter your Password!",
        state: SnackBarStates.error,
      );
    } else if (value.length < 8) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Too short password!",
        state: SnackBarStates.error,
      );
    }
  }

  static void validatingEmailField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Enter your Email!",
        state: SnackBarStates.error,
      );
    }
  }

  static void validatingPhoneField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Enter your Phone Number!",
        state: SnackBarStates.error,
      );
    } else if (value.length < 10) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Too short Phone Number!",
        state: SnackBarStates.error,
      );
    }
  }

  static void validatingConfirmPassField(
    String? value,
    BuildContext context,
    TextEditingController passController,
  ) {
    if (value! != passController.text) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Password doesn't match!",
        state: SnackBarStates.error,
      );
    } else if (value.isEmpty) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Confirm your Password!",
        state: SnackBarStates.error,
      );
    }
  }

  static void validatingNameField(String? value, BuildContext context) {
    if (value!.isEmpty) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: "Name can't be blank!",
        state: SnackBarStates.error,
      );
    }
  }

  static LinearGradient buildCustomLinearGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.kVerifyColor.withOpacity(0.8),
        AppColors.kVerifyColor.withOpacity(0.7),
        AppColors.kVerifyColor.withOpacity(0.0),
        Colors.white,
      ],
      stops: const [0.05, 0.15, 0.6, 0],
    );
  }

  static LinearGradient primaryColorLinearGradient() {
    return LinearGradient(
      colors: [
        const Color(0xFF0062BD),
        const Color(0xFF0062BD).withOpacity(0.5),
        const Color(0xFF0062BD).withOpacity(0.27),
      ],
    );
  }

  static unFocus(context) {
    FocusScope.of(context).unfocus();
  }
}
