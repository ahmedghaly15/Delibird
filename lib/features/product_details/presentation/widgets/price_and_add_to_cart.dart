import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_button.dart';

class PriceAndAddToCartButton extends StatelessWidget {
  const PriceAndAddToCartButton({Key? key, required this.productPrice})
      : super(key: key);

  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Price",
                style: AppTextStyles.snackBarTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.kDefaultIconButtonColor,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.008),
              Text(
                "\$$productPrice EGP",
                style: AppTextStyles.snackBarTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          onPressed: () {},
          height: SizeConfig.screenHeight! * 0.055,
          width: SizeConfig.screenWidth! * 0.5,
          hasIcon: false,
          text: "Add to Cart",
          radius: 10.0,
        ),
      ],
    );
  }
}
