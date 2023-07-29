import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_assets.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';
import 'search_text_form_field.dart';
import 'tab_bar_tabs.dart';
import 'tabs_content.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final DelibirdAppCubit cubit;
  final DelibirdAppStates state;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  /*
  TODO: 
        when using ConditionalBuilder in getting products make 
        the condition: state is GetProductsLoadingState && productsModel != null
   */
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.065,
        right: 15,
        left: 15,
      ),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        gradient: Helper.buildCustomLinearGradient(),
      ),
      child: Column(
        children: <Widget>[
          const SearchTextFormField(),
          SizedBox(height: SizeConfig.screenHeight! * 0.025),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.acerPredator,
              height: 176,
              width: 368,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          TabBarTabs(tabController: tabController),
          TabsContent(
            tabController: tabController,
            cubit: widget.cubit,
            state: widget.state,
          ),
        ],
      ),
    );
  }
}
