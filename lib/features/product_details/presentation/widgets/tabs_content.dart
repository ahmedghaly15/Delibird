import 'package:flutter/material.dart';
import 'package:nexo_app/core/global/app_text_styles.dart';

class TabsContent extends StatelessWidget {
  const TabsContent({
    Key? key,
    required this.tabController,
    required this.description,
  }) : super(key: key);

  final TabController tabController;
  final String description;

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
            description,
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
