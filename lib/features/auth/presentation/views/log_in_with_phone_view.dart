import 'package:flutter/material.dart';
import 'package:nexo_app/features/auth/presentation/widgets/log_in_with_phone_view_body.dart';

class LoginWithPhoneView extends StatelessWidget {
  const LoginWithPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginWithPhoneViewBody(),
    );
  }
}
