import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/core/utils/service_locator.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_with_phone_manager/login_with_phone_cubit.dart';

import 'package:nexo_app/features/auth/presentation/widgets/log_in_with_phone_view_body.dart';

class LoginWithPhoneView extends StatelessWidget {
  const LoginWithPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<LoginWithPhoneCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const Scaffold(
          body: LoginWithPhoneViewBody(),
        ),
      ),
    );
  }
}
