import 'package:flutter/material.dart';
import 'package:nexo_app/features/product_details/presentation/widgets/product_details_view_body.dart';

import '../../../../core/models/products_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(product: product),
    );
  }
}
