import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';

class AppTextStyles {
  static const TextStyle welcomeStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle textButtonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );

  static const TextStyle hintStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Color(0xFFB1B1B1),
  );
}
