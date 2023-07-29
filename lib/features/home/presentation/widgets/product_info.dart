import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/products_model.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.company!,
            style: AppTextStyles.snackBarTitleTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            product.name!.replaceFirst('2022', '\n2022'),
            style: AppTextStyles.textButtonStyle.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(height: product.name!.contains("2022") ? 5 : 25),
          Text(
            "\$${product.price}",
            style: AppTextStyles.textStyle12,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
