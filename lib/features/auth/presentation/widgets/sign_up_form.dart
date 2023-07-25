import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexo_app/features/auth/presentation/widgets/phone_text_field.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../views/log_in_view.dart';
import '../views/managers/sign_up_view_manager/sign_up_view_cubit.dart';

import 'custom_divider.dart';
import 'visibility_icon_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final SignUpViewCubit cubit;
  final SignUpViewStates state;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();
  final FocusNode phonePassFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    disposeFocusNodes();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
          const CustomDivider(),
          SizedBox(height: SizeConfig.screenHeight! * 0.045),
          CustomTextFormField(
            hint: "Enter your Full Name",
            controller: nameController,
            focusNode: nameFocusNode,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            validating: (String? value) {
              Helper.validatingNameField(value, context);
              return null;
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(emailFocusNode),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          CustomTextFormField(
            hint: "Enter your Email",
            controller: emailController,
            focusNode: emailFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            validating: (String? value) {
              Helper.validatingEmailField(value, context);
              return null;
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(passFocusNode),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          CustomTextFormField(
            hint: "Enter your Password",
            controller: passController,
            focusNode: passFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: VisibilityIconButton(
              onPressed: () => widget.cubit.switchPassVisibility(),
              icon: widget.cubit.passVisibility
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
            ),
            obscure: widget.cubit.passVisibility,
            validating: (String? value) {
              Helper.validatingPasswordField(value, context);
              return null;
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(confirmPassFocusNode),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          CustomTextFormField(
            hint: "Confirm your Password",
            controller: confirmPassController,
            focusNode: confirmPassFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: VisibilityIconButton(
              onPressed: () => widget.cubit.switchConfirmPassVisibility(),
              icon: widget.cubit.confirmPassVisibility
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
            ),
            obscure: widget.cubit.confirmPassVisibility,
            validating: (String? value) {
              Helper.validatingConfirmPassField(
                value,
                context,
                passController,
              );
              return null;
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(phonePassFocusNode),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          PhoneTextField(
            phoneController: phoneController,
            phonePassFocusNode: phonePassFocusNode,
            onSelect: (Country value) {
              widget.cubit.changeSelectedCountry(value);
            },
            selectedCountry: widget.cubit.selectedCountry,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.035),
          ConditionalBuilder(
            condition: widget.state is! SignUpLoadingState,
            builder: (context) => CustomButton(
              isLoginWithPhone: false,
              onPressed: () => signUp(context),
              text: "Sign up",
            ),
            fallback: (context) => const CustomCircularProgressIndicator(),
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
    );
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
  }

  void disposeFocusNodes() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    confirmPassFocusNode.dispose();
    phonePassFocusNode.dispose();
  }

  void signUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      widget.cubit.userSignUp(
        context: context,
        email: emailController.text,
        username: nameController.text,
        password: passController.text,
        phone: phoneController.text,
      );
    }
  }
}
