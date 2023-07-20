import 'package:flutter/material.dart';
import 'package:nexo_app/features/home/presentation/views/home_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_navigator.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return Positioned(
      right: 0,
      left: 0,
      top: 150,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: SizeConfig.screenHeight! * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(2, 5), // changes position of shadow
            ),
          ],
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight! * 0.03),
              const Text(
                'Welcome',
                style: AppTextStyles.welcomeStyle,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Container(
                height: SizeConfig.screenHeight! * 0.003,
                width: SizeConfig.screenHeight! * 0.15,
                color: AppColors.kDividerColor,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.045),
              CustomTextFormField(
                hint: "Enter your Full Name",
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.015),
              CustomTextFormField(
                hint: "Enter your Phone Number",
                controller: phoneController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.035),
              CustomButton(
                onPressed: () {
                  print("object");
                  AppNavigator.navigateTo(screen: () => const HomeView());
                },
                text: "Login",
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth! * 0.015),
                  CustomTextButton(onPressed: () {}, text: "Sign up"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
