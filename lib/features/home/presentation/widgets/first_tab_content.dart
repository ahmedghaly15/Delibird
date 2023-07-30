import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/core/widgets/custom_circular_progress_indicator.dart';
import 'package:nexo_app/features/product_details/presentation/view/product_details_view.dart';

import '../../../layout/presentation/views/manager/delibird_app_cubit.dart';
import 'product_item.dart';

class FirstTabContent extends StatelessWidget {
  const FirstTabContent({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final DelibirdAppCubit cubit;
  final DelibirdAppStates state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      // Another correct condition
      condition: cubit.products.isNotEmpty && cubit.productsModel != null,
      // condition: cubit.products.isNotEmpty && state is! GetProductsLoadingState,
      builder: (context) => GridView.builder(
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 550),
            columnCount: cubit.productsModel!.products.length,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: ProductItem(
                  index: index,
                  product: cubit.products[index],
                  onTap: () => AppNavigator.navigateTo(
                    screen: () => const ProductDetailsView(),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: cubit.products.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 25,
        ),
        scrollDirection: Axis.vertical,
        reverse: false,
        primary: true,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.start,
        clipBehavior: Clip.hardEdge,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 220,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
      ),
      fallback: (context) => const CustomCircularProgressIndicator(),
    );
  }
}
