import 'package:flutter/material.dart';
import 'package:nexo_app/features/phone_verification/presentation/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyViewBody(),
    );
  }
}
