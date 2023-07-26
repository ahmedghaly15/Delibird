import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/sign_up_view_manager/sign_up_view_cubit.dart';
import 'package:nexo_app/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:nexo_app/features/layout/presentation/views/layout_view.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: BlocConsumer<SignUpViewCubit, SignUpViewStates>(
          listener: (context, state) => controlSignUpViewStates(state, context),
          builder: (context, state) {
            SignUpViewCubit cubit = SignUpViewCubit.getObject(context);
            return SignUpForm(
              cubit: cubit,
              state: state,
            );
          },
        ),
      ),
    );
  }

  void controlSignUpViewStates(SignUpViewStates state, BuildContext context) {
    if (state is SignUpErrorState) {
      if (state.error == 'weak-password') {
        Helper.buildSnackBar(
          title: "Warning",
          message: "Password is too weak",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'email-already-in-use') {
        Helper.buildSnackBar(
          title: "Warning",
          message: "Account already exists",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is SignUpSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        AppNavigator.navigateAndFinishAll(screen: () => const LayoutView());
      });
      Helper.buildSnackBar(
        title: "Success",
        message: "Account Created Successfully",
        state: SnackBarStates.success,
        context: context,
      );
    }

    if (state is CreateUserSuccessState) {
      AppNavigator.navigateAndFinishAll(screen: () => const LayoutView());
    }
  }
}
