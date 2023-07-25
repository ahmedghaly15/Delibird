import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/features/phone_verification/presentation/views/verify_view.dart';

import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'custom_divider.dart';

class LoginWithPhoneForm extends StatefulWidget {
  const LoginWithPhoneForm({Key? key}) : super(key: key);

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
          const CustomDivider(),
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
          CustomTextFormField(
            hint: "Enter your Phone Number",
            controller: phoneController,
            focusNode: phoneFocusNode,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.phone,
            validating: (String? value) {
              if (value!.isEmpty) {
                Helper.buildSnackBar(
                  context: context,
                  title: "Warning",
                  message: "Enter your Phone Number!",
                  state: SnackBarStates.error,
                );
              } else if (value.length < 8) {
                Helper.buildSnackBar(
                  context: context,
                  title: "Warning",
                  message: "Too short Phone Number!",
                  state: SnackBarStates.error,
                );
              }
              return null;
            },
            onSubmit: (String value) => loginWithPhone(context),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.035),
          CustomButton(
            isLoginWithPhone: false,
            onPressed: () => AppNavigator.navigateTo(
              screen: () => const VerifyView(),
            ),
            text: "Login",
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
    // if (formKey.currentState!.validate()) {
    //   FocusScope.of(context).unfocus();
    // }
  }

  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    // FirebaseAuth auth = FirebaseAuth.instance;

    // await auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   timeout: const Duration(seconds: 60),
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await auth.signInWithCredential(credential);
    //     debugPrint("vERIFICATION COMPLETED");
    //     // authentication successful, do something
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     // authentication failed, do something
    //     debugPrint("vERIFICATION FAILED");
    //     if (e.code == "invalid-phone-number") {
    //       Helper.buildSnackBar(
    //         context: context,
    //         title: "Warning",
    //         message: "Invalid Phone Number!",
    //         state: SnackBarStates.error,
    //       );
    //     }

    //     if (e.code == "phone-number-already-exists") {
    //       Helper.buildSnackBar(
    //         context: context,
    //         title: "Warning",
    //         message: "Phone Number Already Exists!",
    //         state: SnackBarStates.error,
    //       );
    //     }
    //   },
    //   codeSent: (String verificationId, int? resendToken) async {
    //     // code sent to phone number, save verificationId for later use
    //     debugPrint("VERIFICATION CODE SENT");
    //     String smsCode = ''; // get sms code from user
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verificationId,
    //       smsCode: smsCode,
    //     );
    //     await auth.signInWithCredential(credential);
    //     AppNavigator.navigateTo(
    //       screen: () => const VerifyView(),
    //       arguments: [verificationId],
    //     );

    //     // authentication successful, do something
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     debugPrint("CODE AUTO RETRIEVAL TIME OUT");
    //     Helper.buildSnackBar(
    //       context: context,
    //       title: "Warning",
    //       message: "Verification process has timed out",
    //       state: SnackBarStates.error,
    //     );
    //   },
    // );
  }
}
