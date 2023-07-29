import 'package:flutter/material.dart';
import 'package:nexo_app/features/home/presentation/views/home_view.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_navigator.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final DelibirdAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        heroTag: "Floating Home View Button",
        onPressed: () {
          cubit.currentIndex != 2
              ? AppNavigator.navigateTo(
                  screen: () => const HomeView(),
                )
              : null;
        },
        backgroundColor: AppColors.kPrimaryColor,
        child: const Icon(
          Icons.home,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
