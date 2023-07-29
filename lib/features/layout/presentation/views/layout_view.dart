import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';
import 'package:nexo_app/features/layout/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:nexo_app/features/layout/presentation/widgets/custom_floating_button.dart';
import 'package:nexo_app/features/layout/presentation/widgets/layout_view_body.dart';

import '../../../../core/utils/helper.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      Helper.setTheSystemUIOverlayStyle(
        systemNavigationBarColor: Colors.white,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DelibirdAppCubit, DelibirdAppStates>(
      builder: (context, state) {
        DelibirdAppCubit cubit = DelibirdAppCubit.getObject(context);
        return Scaffold(
          body: LayoutViewBody(cubit: cubit),
          bottomNavigationBar: CustomBottomNavigationBar(cubit: cubit),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(cubit: cubit),
        );
      },
    );
  }
}
