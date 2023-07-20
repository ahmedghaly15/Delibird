import 'package:flutter/material.dart';

import '/core/global/app_assets.dart';
import '/core/utils/size_config.dart';
import 'log_in_form.dart';
import 'tall_white_background.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

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
            height: SizeConfig.screenHeight! * 0.4,
          ),
        ),
        const TallWhiteBackground(),
        const LoginForm(),
      ],
    );
  }
}
