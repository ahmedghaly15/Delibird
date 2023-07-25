import 'package:flutter/material.dart';
import 'package:nexo_app/features/auth/presentation/widgets/log_in_with_phone_form.dart';

import '../../../../core/utils/size_config.dart';

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
        child: const LoginWithPhoneForm(),
      ),
    );
  }
}
