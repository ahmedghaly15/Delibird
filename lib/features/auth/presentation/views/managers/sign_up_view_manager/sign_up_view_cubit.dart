import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/network/local/cache_helper.dart';
import '/features/auth/domain/sign_up_view_repo.dart';

part 'sign_up_view_state.dart';

class SignUpViewCubit extends Cubit<SignUpViewStates> {
  SignUpViewCubit(this.signUpViewRepo) : super(SignUpViewInitialState());

  static SignUpViewCubit getObject(context) => BlocProvider.of(context);

  SignUpViewRepo signUpViewRepo;

  bool passVisibility = true;
  bool confirmPassVisibility = true;

  void userSignUp({
    required String username,
    required String email,
    required String password,
    required String phone,
    required BuildContext context,
  }) {
    emit(SignUpLoadingState());

    signUpViewRepo
        .userSignUp(
      username: username,
      email: email,
      password: password,
      phone: phone,
      context: context,
    )
        .then((value) {
      firestoreCreateUSer(
        name: username,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);

      // TODO: Use GetUserData function like in Linkup App in this line
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(SignUpErrorState(error.code.toString()));
      }
    });
  }

  void firestoreCreateUSer({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    signUpViewRepo
        .firestoreCreateUSer(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    )
        .then((value) {
      emit(CreateUserSuccessState());
      emit(SignUpSuccessState(uId));
    }).catchError((error) {
      CreateUserErrorState(error.toString());
    });
  }

  void switchPassVisibility() {
    passVisibility = !passVisibility;
    emit(SwitchPassVisibleState());
  }

  void switchConfirmPassVisibility() {
    confirmPassVisibility = !confirmPassVisibility;
    emit(SwitchConfirmPassVisibleState());
  }
}
