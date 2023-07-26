import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/sign_up_view_manager/sign_up_view_cubit.dart';

import '../../../../../../core/models/verify_phone_model.dart';
import '../../../../domain/log_in_with_phone_repo.dart';

part 'login_with_phone_state.dart';

class LoginWithPhoneCubit extends Cubit<LoginWithPhoneStates> {
  LoginWithPhoneCubit(this.loginWithPhoneRepo)
      : super(LoginWithPhoneInitialState());

  LoginWithPhoneRepo loginWithPhoneRepo;

  static LoginWithPhoneCubit getObject(context) => BlocProvider.of(context);

  VerifyPhoneModel? verifyPhoneModel;

  // OtpModel? otpModel;

  // void sendOtp({
  //   required String phoneNumber,
  // }) {
  //   emit(SendOtpCodeLoadingState());
  //   loginWithPhoneRepo
  //       .sendOtp(
  //     phoneNumber: phoneNumber,
  //   )
  //       .then((value) {
  //     otpModel = OtpModel.fromJson(value.data);
  //     CacheHelper.saveData(
  //       key: 'uId',
  //       value: otpModel!.account!.id,
  //     );
  //     emit(SendOtpCodeSuccessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(SendOtpCodeErrorState(error.toString()));
  //   });
  // }

  void verifyPhoneNumber({
    required String fullName,
    required String phoneNumber,
    required BuildContext context,
  }) {
    emit(VerifyPhoneLoadingState());
    loginWithPhoneRepo
        .verifyPhone(
      fullName: fullName,
      phoneNumber: phoneNumber,
    )
        .then((value) {
      verifyPhoneModel = VerifyPhoneModel.fromJson(value.data);
      if (verifyPhoneModel!.message == "Account Created Successfully") {
        SignUpViewCubit.getObject(context).firestoreCreateUSer(
          name: fullName,
          phone: phoneNumber,
        );
      }
      emit(VerifyPhoneSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        // TODO: Handle Errors like in BookHive
      }
      debugPrint(error.toString());
      emit(VerifyPhoneErrorState(error.toString()));
    });
  }

  Country selectedCountry = Country(
    phoneCode: "20",
    countryCode: "EG",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Egypt",
    example: "Egypt",
    displayName: "Egypt",
    displayNameNoCountryCode: "EN",
    e164Key: "",
  );

  void changeSelectedCountry(Country value) {
    selectedCountry = value;
    emit(SelectedCountryChangesSuccessState(selectedCountry, value));
  }
}
