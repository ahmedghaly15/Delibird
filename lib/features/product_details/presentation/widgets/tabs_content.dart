import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

class TabsContent extends StatelessWidget {
  const TabsContent({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 400,
      width: double.maxFinite,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          Text(
            "Sint dolor aute deserunt laboris irure fugiat reprehenderit nulla mollit tempor. Labore culpa enim mollit occaecat sint excepteur incididunt est velit occaecat elit Lorem exercitation cupidatat. Do exercitation ullamco sit esse laboris quis irure aliquip minim reprehenderit magna et enim duis. Elit officia laborum reprehenderit cupidatat ad consectetur enim duis excepteur cillum dolore sunt. Ullamco esse magna magna reprehenderit incididunt fugiat reprehenderit. Id enim sunt sunt excepteur esse sunt ut ea.",
            style: AppTextStyles.hintStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const Text("Specification"),
          const Text("Review"),
        ],
      ),
    );
  }
}
