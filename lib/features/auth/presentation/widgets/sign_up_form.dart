import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/features/auth/presentation/views/log_in_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Positioned(
      right: 0,
      left: 0,
      top: 150,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: SizeConfig.screenHeight! * 0.6,
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
                'Sign Up',
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
                hint: "Enter your Email",
                controller: emailController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.015),
              CustomTextFormField(
                hint: "Enter your Password",
                controller: passController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                obscure: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.015),
              CustomTextFormField(
                hint: "Confirm your Password",
                controller: confirmPassController,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                obscure: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
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
                  // TODO: Use navigateAndFinishAll
                },
                text: "Sign up",
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth! * 0.015),
                  CustomTextButton(
                    onPressed: () => AppNavigator.navigateAndFinishAll(
                      screen: () => const LoginView(),
                      transition: Transition.rightToLeft,
                    ),
                    text: "Login",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
