import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/size_config.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.image,
    required this.text,
    required this.active,
  }) : super(key: key);

  final String image;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: SizeConfig.screenHeight! * 0.06,
        width: SizeConfig.screenWidth! * 0.35,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: active ? AppColors.kPrimaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 8,
              spreadRadius: 1,
              color: AppColors.kShadowColor,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight! * 0.05,
              width: SizeConfig.screenHeight! * 0.05,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    color: AppColors.kShadowColor,
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(flex: 1),
            Text(
              text,
              style: AppTextStyles.buttonStyle.copyWith(
                fontSize: 20,
                color: active ? Colors.white : Colors.black,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
