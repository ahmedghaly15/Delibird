import 'package:flutter/material.dart';

import '../../../../core/models/products_model.dart';
import '../../../../core/utils/size_config.dart';
import 'list_product_item.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.13,
        width: SizeConfig.screenWidth,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 8,
          ),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) => ListProductItem(
            productImage: products[index].image!,
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: SizeConfig.screenWidth! * 0.05,
          ),
        ),
      ),
    );
  }
}
