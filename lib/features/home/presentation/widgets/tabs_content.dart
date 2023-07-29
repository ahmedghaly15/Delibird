import 'package:flutter/material.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import 'first_tab_content.dart';

class TabsContent extends StatelessWidget {
  const TabsContent({
    Key? key,
    required this.tabController,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final TabController tabController;
  final DelibirdAppCubit cubit;
  final DelibirdAppStates state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          FirstTabContent(
            cubit: cubit,
            state: state,
          ),
          const Center(child: Text("Acer")),
          const Center(child: Text("Razer")),
        ],
      ),
    );
  }
}
