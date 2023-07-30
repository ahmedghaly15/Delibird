import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/size_config.dart';

class ListProductItem extends StatelessWidget {
  const ListProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.12,
      width: SizeConfig.screenHeight! * 0.12,
      padding: const EdgeInsets.all(8.0),
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
        child: CachedNetworkImage(
          imageUrl:
              'https://m.media-amazon.com/images/I/7183SjkrSnL._AC_SL1500_.jpg',
        ),
      ),
    );
  }
}
