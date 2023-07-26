import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/core/global/app_navigator.dart';
import 'package:nexo_app/core/network/local/cache_helper.dart';
import 'package:nexo_app/features/auth/presentation/views/log_in_view.dart';
import 'package:nexo_app/features/favorites/presentation/view/favorites_view.dart';
import 'package:nexo_app/features/log_out/presentation/view/log_out_view.dart';
import 'package:nexo_app/features/notifications/presentation/views/notifications_view.dart';
import 'package:nexo_app/features/settings/presentation/view/settings_view.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/helper.dart';
import '../../../domain/layout_repo.dart';

part 'delibird_app_state.dart';

class DelibirdAppCubit extends Cubit<DelibirdAppStates> {
  DelibirdAppCubit(this.layoutRepo) : super(DelibirdAppInitialState());

  static DelibirdAppCubit getObject(context) => BlocProvider.of(context);

  LayoutRepo layoutRepo;

  int currentIndex = 0;

  //============ Bottom Nav Bar Screens ============
  List<Widget> bottomNavScreens = const <Widget>[
    LogOutView(),
    FavoritesView(),
    NotificationsView(),
    SettingsView(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: "Chats",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group_rounded),
      label: "Users",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Me",
    ),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;

    emit(ChangeBottomNavState());
  }

  void getUserData(String? uId) {
    emit(GetUserLoadingState());

    // Storing The Current User Id
    uId = CacheHelper.getStringData(key: 'uId');

    layoutRepo.getUserData(uId).then((value) {
      Helper.model = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  void signOut() {
    layoutRepo.signOut().then((value) {
      CacheHelper.removeData(key: 'uId');
      AppNavigator.navigateAndFinish(screen: () => const LoginView());
      emit(SignOutSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SignOutErrorState(error.toString()));
    });
  }
}
