import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_navigator.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../get_help/presentation/views/get_help_view.dart';

class BackgroundImageAndHelpIcon extends StatelessWidget {
  const BackgroundImageAndHelpIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Positioned(
          right: 0,
          left: 0,
          top: -10,
          child: Image.asset(
            AppAssets.city,
            fit: BoxFit.cover,
            height: SizeConfig.screenHeight! * 0.4,
          ),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: CustomIconButton(
            icon: Icons.help,
            iconColor: AppColors.kDefaultIconButtonColor,
            iconSize: 25,
            onTap: () => AppNavigator.navigateTo(
              screen: () => const GetHelpView(),
            ),
          ),
        ),
      ],
    );
  }
}
