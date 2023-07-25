import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '/core/global/app_colors.dart';
import '/core/global/app_text_styles.dart';
import '/core/utils/size_config.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/custom_text_button.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({Key? key}) : super(key: key);

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  /*
  
   TODO: 

  phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );

   */

  final TextEditingController phoneController = TextEditingController();
  final FocusNode pinputFocusNode = FocusNode();

  String? otpCode;
  // final String verificationId = Get.arguments[0];
  FirebaseAuth auth = FirebaseAuth.instance;

  // final TextEditingController firstBoxController = TextEditingController();
  // final TextEditingController secondBoxController = TextEditingController();
  // final TextEditingController thirdBoxController = TextEditingController();
  // final TextEditingController fourthBoxController = TextEditingController();

  // final FocusNode firstBoxFocusNode = FocusNode();
  // final FocusNode secondBoxFocusNode = FocusNode();
  // final FocusNode thirdBoxFocusNode = FocusNode();
  // final FocusNode fourthBoxFocusNode = FocusNode();

  // String value1 = "";
  // String value2 = "";
  // String value3 = "";
  // String value4 = "";

  // void verifyOtp(
  //   String verificationId,
  //   String userOtp,
  // ) async {
  //   try {
  //     PhoneAuthCredential creds = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: userOtp);
  //     User? user = (await auth.signInWithCredential(creds)).user;
  //     if (user != null) {
  //       AppNavigator.navigateAndFinishAll(screen: () => const HomeView());
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Helper.buildSnackBar(
  //       context: context,
  //       title: "Warning",
  //       message: e.message.toString(),
  //       state: SnackBarStates.error,
  //     );
  //   }
  // }

  // void _login() {
  //   if (otpCode != null) {
  //     verifyOtp(verificationId, otpCode!);
  //   } else {
  //     Helper.buildSnackBar(
  //       context: context,
  //       title: "Warning",
  //       message: "Enter 6 digits code",
  //       state: SnackBarStates.error,
  //     );
  //   }
  // }

  @override
  void dispose() {
    phoneController.dispose();
    pinputFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(2, 5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
    // String smsCode = "$value1$value2$value3$value4";

    return Column(
      children: <Widget>[
        Container(
          height: SizeConfig.screenHeight! * 0.44,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.kVerifyColor.withOpacity(0.85),
                AppColors.kVerifyColor.withOpacity(0.0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight! * 0.095),
              Text(
                "Verify Phone",
                style: AppTextStyles.welcomeStyle.copyWith(color: Colors.white),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.13),
              Form(
                key: formKey,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,

                    autofocus: true,
                    controller: phoneController,
                    focusNode: pinputFocusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    validator: (value) {
                      return value == '2222' ? null : 'Pin is incorrect';
                    },
                    // onClipboardFound: (value) {
                    //   debugPrint('onClipboardFound: $value');
                    //   pinController.setText(value);
                    // },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) {
                      debugPrint('onCompleted: $pin');
                    },
                    onChanged: (value) {
                      debugPrint('onChanged: $value');
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: AppColors.kPrimaryColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.kPrimaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        // color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.005),
            CustomTextButton(
              onPressed: () {
                // TODO: Finish functionality of this function
              },
              text: "Resend Code",
              textStyle: AppTextStyles.buttonStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            CustomButton(
              isLoginWithPhone: false,
              height: SizeConfig.screenHeight! * 0.065,
              width: SizeConfig.screenWidth! * 0.75,
              onPressed: () {
                // _login();

                // FirebaseAuth auth = FirebaseAuth.instance;
                // PhoneAuthCredential credential = PhoneAuthProvider.credential(
                //   verificationId: "",
                //   smsCode: smsCode,
                // );
                // await auth.signInWithCredential(credential);

                // TODO: Finish functionality of this function
              },
              text: "Verify",
            ),
          ],
        ),
      ],
    );
  }

  // void disposeControllers() {
  //   firstBoxController.dispose();
  //   secondBoxController.dispose();
  //   thirdBoxController.dispose();
  //   fourthBoxController.dispose();
  // }

  // void disposeFocusNodes() {
  //   firstBoxFocusNode.dispose();
  //   secondBoxFocusNode.dispose();
  //   thirdBoxFocusNode.dispose();
  //   fourthBoxFocusNode.dispose();
  // }
}
