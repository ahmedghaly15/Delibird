import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '/core/network/local/cache_helper.dart';
import '/features/auth/domain/log_in_view_repo.dart';
import 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewStates> {
  LoginViewCubit(this.loginViewRepo) : super(LoginViewCubitInitialState());

  static LoginViewCubit getObject(context) => BlocProvider.of(context);

  LoginViewRepo loginViewRepo;

  bool passVisibility = true;

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());

    loginViewRepo
        .userLogin(
      email: email,
      password: password,
      context: context,
    )
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      DelibirdAppCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(LoginErrorState(error.code.toString()));
      }
    });
  }

  signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());
    loginViewRepo.signInWithGoogle().then((value) {
      emit(SignInWithGoogleSuccessState(value.user!.uid));
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      // DelibirdAppCubit.getObject(context).getUserData(value.user!.uid);
    }).catchError((error) {
      emit(SignInWithGoogleErrorState(error.toString()));
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState());
  }
}
