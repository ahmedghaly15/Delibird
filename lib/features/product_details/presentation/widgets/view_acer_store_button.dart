import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class ViewAcerStoreButton extends StatelessWidget {
  const ViewAcerStoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: SizeConfig.screenHeight! * 0.085,
        width: SizeConfig.screenWidth! * 0.9,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColors.kShadowColor,
              blurRadius: 4,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight! * 0.065,
              width: SizeConfig.screenHeight! * 0.065,
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.kAcerLogoColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(0, 0),
                    spreadRadius: 2,
                    blurRadius: 4,
                    color: AppColors.kShadowColor,
                  ),
                ],
              ),
              child: Image.asset(AppAssets.acerLogo),
            ),
            const Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Acer Official Store",
                  style: AppTextStyles.helpHeader.copyWith(color: Colors.black),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.005),
                Text(
                  "View Store",
                  style: AppTextStyles.textButtonStyle.copyWith(
                    color: AppColors.kDefaultIconButtonColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3),
            CustomIconButton(
              height: SizeConfig.screenHeight! * 0.03,
              width: SizeConfig.screenHeight! * 0.03,
              icon: Icons.arrow_forward_ios,
              iconColor: AppColors.kPrimaryColor,
              iconSize: 18,
              radius: 5,
              onTap: () {},
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
