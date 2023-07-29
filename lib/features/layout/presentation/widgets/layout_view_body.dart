import 'package:flutter/material.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/size_config.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({Key? key, required this.cubit}) : super(key: key);

  final DelibirdAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (cubit.currentIndex != 2) {
          cubit.changeBottomNavToHome();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => Helper.unFocus(context),
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: Helper.buildCustomLinearGradient(),
          ),
          child: cubit.bottomNavScreens[cubit.currentIndex],
        ),
      ),
    );
  }
}
