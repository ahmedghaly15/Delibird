import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:nexo_app/core/widgets/custom_circular_progress_indicator.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_navigator.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

import '../../../phone_verification/presentation/views/verify_view.dart';
import '../views/managers/log_in_with_phone_manager/login_with_phone_cubit.dart';
import '../../../../core/widgets/custom_divider.dart';
import 'phone_text_field.dart';

class LoginWithPhoneForm extends StatefulWidget {
  const LoginWithPhoneForm({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final LoginWithPhoneCubit cubit;
  final LoginWithPhoneStates state;

  @override
  State<LoginWithPhoneForm> createState() => _LoginWithPhoneFormState();
}

class _LoginWithPhoneFormState extends State<LoginWithPhoneForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();

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
          CustomDivider(
            height: SizeConfig.screenHeight! * 0.003,
            width: SizeConfig.screenHeight! * 0.15,
            color: AppColors.kDividerColor,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.045),
          CustomTextFormField(
            hint: "Enter your Full Name",
            controller: nameController,
            focusNode: nameFocusNode,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            validating: (String? value) {
              if (value!.isEmpty) {
                Helper.buildSnackBar(
                  context: context,
                  title: "Warning",
                  message: "Name can't be blank!",
                  state: SnackBarStates.error,
                );
              }
              return null;
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(phoneFocusNode),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          PhoneTextField(
            phoneController: phoneController,
            phonePassFocusNode: phoneFocusNode,
            onSelect: (Country value) {
              widget.cubit.changeSelectedCountry(value);
            },
            selectedCountry: widget.cubit.selectedCountry,
            onSubmit: (String value) => loginWithPhone(context),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.035),
          ConditionalBuilder(
            condition: widget.state is! VerifyPhoneLoadingState,
            builder: (context) => CustomButton(
              hasIcon: false,
              onPressed: () => loginWithPhone(context),
              text: "Login",
            ),
            fallback: (context) => const CustomCircularProgressIndicator(),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.025),
          CustomTextButton(
            onPressed: () => AppNavigator.navigateTo(
              screen: () => const VerifyView(),
            ),
            text: "Verify",
          ),
        ],
      ),
    );
  }

  void disposeControllers() {
    phoneController.dispose();
    nameController.dispose();
  }

  void disposeFocusNodes() {
    phoneFocusNode.dispose();
    nameFocusNode.dispose();
  }

  void loginWithPhone(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Helper.unFocus(context);

      widget.cubit.verifyPhoneNumber(
        context: context,
        fullName: nameController.text,
        phoneNumber:
            "${widget.cubit.selectedCountry.phoneCode}${phoneController.text}",
      );
    }
  }
}
