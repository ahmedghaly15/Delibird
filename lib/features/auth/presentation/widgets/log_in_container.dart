import 'package:flutter/material.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_cubit.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_state.dart';
import 'package:nexo_app/features/auth/presentation/widgets/log_in_form.dart';

import '../../../../core/utils/size_config.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final LoginViewCubit cubit;
  final LoginViewStates state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: 150,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: SizeConfig.screenHeight! * 0.4,
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
        child: LoginForm(cubit: cubit, state: state),
      ),
    );
  }
}
