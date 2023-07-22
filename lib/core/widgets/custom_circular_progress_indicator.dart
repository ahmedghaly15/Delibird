import 'package:flutter/material.dart';

import '../global/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
        backgroundColor: AppColors.kPrimaryColor,
      ),
    );
  }
}
