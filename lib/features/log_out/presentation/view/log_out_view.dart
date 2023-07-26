import 'package:flutter/material.dart';
import 'package:nexo_app/core/widgets/custom_button.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

class LogOutView extends StatelessWidget {
  const LogOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        onPressed: DelibirdAppCubit.getObject(context).signOut,
        isLoginWithPhone: false,
        text: "Sign out",
      ),
    );
  }
}
