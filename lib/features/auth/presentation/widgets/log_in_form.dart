import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../views/managers/log_in_view_manager/login_view_cubit.dart';
import '../views/sign_up_view.dart';
import '/features/auth/presentation/views/managers/log_in_view_manager/login_view_state.dart';
import 'custom_divider.dart';
import 'visibility_icon_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final LoginViewCubit cubit;
  final LoginViewStates state;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  @override
  void dispose() {
    disposeControllers();
    disposeFocusNodes();
    super.dispose();
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
            'Welcome',
            style: AppTextStyles.welcomeStyle,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          const CustomDivider(),
          SizedBox(height: SizeConfig.screenHeight! * 0.045),
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
            onSubmit: (String value) => login(context),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.035),
          ConditionalBuilder(
            condition: widget.state is! LoginLoadingState,
            builder: (context) => CustomButton(
              isLoginWithPhone: false,
              onPressed: () => login(context),
              text: "Login",
            ),
            fallback: (context) => const CustomCircularProgressIndicator(),
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
              CustomTextButton(
                onPressed: () => AppNavigator.navigateTo(
                  screen: () => const SignUpView(),
                ),
                text: "Sign up",
              ),
            ],
          ),
        ],
      ),
    );
  }

  void disposeControllers() {
    passController.dispose();
    emailController.dispose();
  }

  void disposeFocusNodes() {
    passFocusNode.dispose();
    emailFocusNode.dispose();
  }

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      widget.cubit.userLogin(
        context: context,
        email: emailController.text,
        password: passController.text,
      );
    }
  }
}
