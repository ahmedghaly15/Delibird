import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nexo_app/core/utils/size_config.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/products_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  final Product product;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.145,
      width: SizeConfig.screenWidth! * 0.43,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: AppColors.kShadowColor,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Hero(
              tag: product.id!,
              child: CachedNetworkImage(
                imageUrl: product.image!,
                height: SizeConfig.screenHeight! * 0.145,
                width: SizeConfig.screenWidth! * 0.43,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
