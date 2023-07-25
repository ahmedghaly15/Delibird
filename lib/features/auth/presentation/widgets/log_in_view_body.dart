import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_cubit.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_state.dart';

import '../../../../core/global/app_navigator.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/utils/helper.dart';
import '../../../home/presentation/views/home_view.dart';
import 'background_image_and_help_icon.dart';
import 'log_in_container.dart';
import 'tall_white_background.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewCubit, LoginViewStates>(
      listener: (context, state) => controlLoginViewStates(state, context),
      builder: (context, state) {
        LoginViewCubit cubit = LoginViewCubit.getObject(context);
        return Stack(
          children: <Widget>[
            const BackgroundImageAndHelpIcon(),
            TallWhiteBackground(
              isLoginWithPhone: false,
              isLoginView: true,
              loginViewCubit: cubit,
            ),
            LoginContainer(
              cubit: cubit,
              state: state,
            ),
          ],
        );
      },
    );
  }

  void controlLoginViewStates(LoginViewStates state, BuildContext context) {
    if (state is LoginErrorState) {
      if (state.error == 'user-not-found') {
        Helper.buildSnackBar(
          title: "Warning",
          message: "No user found for that email",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'wrong-password') {
        Helper.buildSnackBar(
          title: "Warning",
          message: "Wrong Password",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is LoginSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        AppNavigator.navigateAndFinish(screen: () => const HomeView());
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        AppNavigator.navigateAndFinish(screen: () => const HomeView());
      });
    }
  }
}
