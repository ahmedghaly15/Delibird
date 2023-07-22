import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class SocialAuthIcon extends StatelessWidget {
  const SocialAuthIcon({
    Key? key,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.1),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: SizeConfig.screenHeight! * 0.052,
          width: SizeConfig.screenHeight! * 0.052,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(2, 5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              image,
              height: SizeConfig.screenHeight! * 0.035,
            ),
          ),
        ),
      ),
    );
  }
}
