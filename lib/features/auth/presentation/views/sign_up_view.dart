import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/core/utils/service_locator.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/sign_up_view_manager/sign_up_view_cubit.dart';

import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<SignUpViewCubit>(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
