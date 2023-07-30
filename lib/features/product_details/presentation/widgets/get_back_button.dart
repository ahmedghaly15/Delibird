import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_navigator.dart';
import '../../../../core/utils/size_config.dart';

class GetBackButton extends StatelessWidget {
  const GetBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.055,
      width: SizeConfig.screenHeight! * 0.055,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: AppColors.kShadowColor,
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => AppNavigator.getBack(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.kShadowColor,
          size: 30,
        ),
      ),
    );
  }
}
