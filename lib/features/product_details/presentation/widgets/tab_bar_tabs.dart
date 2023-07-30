import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

import '../../../../core/global/app_colors.dart';
import 'circle_tab_indicator.dart';

class TabBarTabs extends StatelessWidget {
  const TabBarTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelPadding: const EdgeInsets.only(left: 20, right: 20),
        indicator: const CircleTabIndicator(
          color: AppColors.kPrimaryColor,
          radius: 3.5,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.kPrimaryColor,
        labelStyle: AppTextStyles.snackBarTitleTextStyle.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(text: "Overview"),
          Tab(text: "Specification"),
          Tab(text: "Review"),
        ],
      ),
    );
  }
}
