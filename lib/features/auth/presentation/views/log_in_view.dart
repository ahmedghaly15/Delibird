import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/log_in_view_body.dart';
import '/core/utils/service_locator.dart';
import '/features/auth/presentation/views/managers/log_in_view_manager/login_view_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<LoginViewCubit>(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}
