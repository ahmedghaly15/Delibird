import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import 'custom_tab.dart';

class HomeTabBarTabs extends StatefulWidget {
  const HomeTabBarTabs({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  State<HomeTabBarTabs> createState() => _HomeTabBarTabsState();
}

class _HomeTabBarTabsState extends State<HomeTabBarTabs> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.tabController.index;
    widget.tabController.addListener(handleTabSelection);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(handleTabSelection);
    super.dispose();
  }

  void handleTabSelection() {
    setState(() {
      currentIndex = widget.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: widget.tabController,
        isScrollable: true,
        labelColor: Colors.black,
        labelPadding: const EdgeInsets.only(right: 20),
        indicatorColor: Colors.transparent.withOpacity(0),
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        tabs: <Widget>[
          CustomTab(
            image: AppAssets.vectorTrophy,
            text: "All",
            active: widget.tabController.index == 0,
          ),
          CustomTab(
            image: AppAssets.mask,
            text: "Acer",
            active: widget.tabController.index == 1,
          ),
          CustomTab(
            image: AppAssets.razerLogo,
            text: "Razer",
            active: widget.tabController.index == 2,
          ),
        ],
      ),
    );
  }
}
