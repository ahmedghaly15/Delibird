import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage(
      {Key? key, required this.image, required this.productId})
      : super(key: key);

  final String image;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: SizeConfig.screenHeight! * 0.3,
        width: SizeConfig.screenWidth! * 0.9,
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColors.kShadowColor,
              blurRadius: 4,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: productId,
            child: CachedNetworkImage(
              height: SizeConfig.screenHeight! * 0.3,
              width: SizeConfig.screenWidth! * 0.9,
              imageUrl: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
