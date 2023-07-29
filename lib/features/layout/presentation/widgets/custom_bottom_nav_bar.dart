import 'package:flutter/material.dart';

import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '../../../../core/global/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final DelibirdAppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.1,
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: cubit.bottomNavItems,
        currentIndex: cubit.currentIndex,
        onTap: (int index) =>
            index == 2 ? null : cubit.changeBottomNavIndex(index),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFFB1B1B1),
        selectedItemColor: AppColors.kPrimaryColor,
        selectedIconTheme: const IconThemeData(size: 25),
        unselectedIconTheme: const IconThemeData(size: 22),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}


/*

 BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.1,
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: cubit.bottomNavItems,
        currentIndex: cubit.currentIndex,
        onTap: (int index) => cubit.changeBottomNavIndex(index),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFFB1B1B1),
        selectedItemColor: AppColors.kPrimaryColor,
        selectedIconTheme: const IconThemeData(size: 25),
        unselectedIconTheme: const IconThemeData(size: 22),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );

 */