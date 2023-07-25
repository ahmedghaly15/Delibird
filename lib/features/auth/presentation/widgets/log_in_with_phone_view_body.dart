import 'package:flutter/material.dart';
import 'package:nexo_app/features/auth/presentation/widgets/log_in_with_phone_container.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/utils/size_config.dart';
import 'tall_white_background.dart';

class LoginWithPhoneViewBody extends StatelessWidget {
  const LoginWithPhoneViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          left: 0,
          top: -10,
          child: Image.asset(
            AppAssets.city,
            fit: BoxFit.cover,
            height: SizeConfig.screenHeight! * 0.6,
          ),
        ),
        const TallWhiteBackground(
          isLoginView: false,
          isLoginWithPhone: true,
        ),
        const LoginWithPhoneContainer(),
      ],
    );
  }
}
