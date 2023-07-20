import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/global/app_colors.dart';

class AppTheme {
  static ThemeData appTheme() => ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
      );
}
