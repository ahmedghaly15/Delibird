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

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController phoneController = TextEditingController();
  final FocusNode pinputFocusNode = FocusNode();

  @override
  void dispose() {
    disposeControllerAndFocusNode();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    length: 4,
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
              hasIcon: false,
              height: SizeConfig.screenHeight! * 0.065,
              width: SizeConfig.screenWidth! * 0.75,
              onPressed: () {
                // TODO: Finish functionality of this function
              },
              text: "Verify",
            ),
          ],
        ),
      ],
    );
  }

  void disposeControllerAndFocusNode() {
    phoneController.dispose();
    pinputFocusNode.dispose();
  }
}
