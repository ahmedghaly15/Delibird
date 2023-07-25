import 'package:flutter/material.dart';
import 'package:nexo_app/features/auth/presentation/widgets/background_image_and_help_icon.dart';

import 'sign_up_container.dart';
import 'tall_white_background.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        BackgroundImageAndHelpIcon(),
        TallWhiteBackground(
          isLoginView: false,
          isLoginWithPhone: false,
        ),
        SignUpContainer(),
      ],
    );
  }
}
