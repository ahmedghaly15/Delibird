import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nexo_app/features/auth/presentation/widgets/log_in_with_phone_form.dart';
import 'package:nexo_app/features/layout/presentation/views/layout_view.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../views/managers/log_in_with_phone_manager/login_with_phone_cubit.dart';

class LoginWithPhoneContainer extends StatelessWidget {
  const LoginWithPhoneContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: SizeConfig.screenHeight! * 0.3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: SizeConfig.screenHeight! * 0.35,
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
        child: BlocConsumer<LoginWithPhoneCubit, LoginWithPhoneStates>(
          listener: (context, state) => controlLoginWithPhoneViewStates(
            LoginWithPhoneCubit.getObject(context),
            state,
            context,
          ),
          builder: (context, state) {
            LoginWithPhoneCubit cubit = LoginWithPhoneCubit.getObject(context);
            return LoginWithPhoneForm(
              cubit: cubit,
              state: state,
            );
          },
        ),
      ),
    );
  }

  void controlLoginWithPhoneViewStates(
    LoginWithPhoneCubit cubit,
    LoginWithPhoneStates state,
    BuildContext context,
  ) {
    if (state is VerifyPhoneSuccessState &&
        cubit.verifyPhoneModel!.status == 200) {
      AppNavigator.navigateAndFinishAll(screen: () => const LayoutView());
      Helper.buildSnackBar(
        context: context,
        title: "Success",
        message:
            LoginWithPhoneCubit.getObject(context).verifyPhoneModel!.message!,
        state: SnackBarStates.success,
      );
    }

    // To get the Error Messages
    // I am Handling it using Validation of Form, So i comment it
    // if (state is VerifyPhoneSuccessState &&
    //     cubit.verifyPhoneModel!.status == 405) {
    //   Helper.buildSnackBar(
    //     context: context,
    //     title: "Warning",
    //     message: cubit.verifyPhoneModel!.message!,
    //     state: SnackBarStates.error,
    //   );
    // }

    if (state is VerifyPhoneErrorState) {
      Helper.buildSnackBar(
        context: context,
        title: "Warning",
        message: state.error,
        state: SnackBarStates.error,
      );
    }
  }
}
