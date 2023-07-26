import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/core/widgets/custom_button.dart';
import 'package:nexo_app/features/auth/presentation/views/log_in_with_phone_view.dart';

import '../views/managers/log_in_view_manager/login_view_cubit.dart';
import '/core/global/app_assets.dart';
import '/core/global/app_text_styles.dart';
import '/core/utils/size_config.dart';
import 'or_divider.dart';
import 'social_auth_icon.dart';

class TallWhiteBackground extends StatelessWidget {
  const TallWhiteBackground({
    Key? key,
    required this.isLoginView,
    required this.isLoginWithPhone,
    this.loginViewCubit,
  }) : super(key: key);

  final bool isLoginView;
  final bool isLoginWithPhone;
  final LoginViewCubit? loginViewCubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: isLoginWithPhone
          ? SizeConfig.screenHeight! * 0.45
          : SizeConfig.screenHeight! * 0.3,
      child: Container(
        height: isLoginWithPhone
            ? SizeConfig.screenHeight! * 0.2
            : SizeConfig.screenHeight! * 0.7,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60.0),
            topLeft: Radius.circular(60.0),
          ),
        ),
        child: isLoginView
            ? Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const OrDivider(),
                        SizedBox(width: SizeConfig.screenWidth! * 0.02),
                        const Text("OR", style: AppTextStyles.orStyle),
                        SizedBox(width: SizeConfig.screenWidth! * 0.02),
                        const OrDivider(),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.06),
                    CustomButton(
                      onPressed: () => AppNavigator.navigateTo(
                        screen: () => const LoginWithPhoneView(),
                      ),
                      isLoginWithPhone: true,
                      text: "Login With Phone",
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SocialAuthIcon(image: AppAssets.facebookIcon),
                        const SocialAuthIcon(image: AppAssets.ios),
                        SocialAuthIcon(
                          image: AppAssets.googleIcon,
                          onTap: loginViewCubit!.signInWithGoogle(
                            context: context,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
