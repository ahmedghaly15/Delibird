import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/products_model.dart';
import 'add_to_cart_icon_button.dart';
import 'product_image.dart';
import 'product_info.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final int index;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 239,
      width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: AppColors.kShadowColor,
            blurRadius: 8,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          ProductImage(
            product: product,
            onPressed: () {},
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: ProductInfo(product: product),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: AddToCartIconButton(),
          ),
        ],
      ),
    );
  }
}
