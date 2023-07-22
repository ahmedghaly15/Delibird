import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.003,
      width: SizeConfig.screenHeight! * 0.15,
      color: AppColors.kDividerColor,
    );
  }
}
