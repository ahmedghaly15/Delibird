import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_colors.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';
import 'package:nexo_app/features/product_details/presentation/widgets/tabs_content.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_divider.dart';
import 'get_back_button.dart';
import 'list_of_products.dart';
import 'price_and_add_to_cart.dart';
import 'product_details_image.dart';
import 'tab_bar_tabs.dart';
import 'view_acer_store_button.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: SizeConfig.screenHeight! * 0.065,
          right: 20,
          left: 20,
        ),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: Helper.buildCustomLinearGradient(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const GetBackButton(),
            SizedBox(height: SizeConfig.screenHeight! * 0.025),
            const Text(
              "Predator Helios 300",
              style: AppTextStyles.productDetailsName,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.008),
            Text(
              "Type: Gaming Laptop",
              style: AppTextStyles.orStyle.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.022),
            const ProductDetailsImage(),
            SizedBox(height: SizeConfig.screenHeight! * 0.025),
            const ListOfProducts(),
            SizedBox(height: SizeConfig.screenHeight! * 0.022),
            const ViewAcerStoreButton(),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            const PriceAndAddToCartButton(),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            Align(
              alignment: Alignment.center,
              child: CustomDivider(
                height: SizeConfig.screenHeight! * 0.0025,
                width: SizeConfig.screenHeight! * 0.35,
                color: AppColors.kDefaultIconButtonColor,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            TabBarTabs(tabController: tabController),
            TabsContent(tabController: tabController),
          ],
        ),
      ),
    );
  }
}
