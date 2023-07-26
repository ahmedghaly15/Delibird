part of 'login_with_phone_cubit.dart';

abstract class LoginWithPhoneStates {}

class LoginWithPhoneInitialState extends LoginWithPhoneStates {}

// class SendOtpCodeLoadingState extends LoginWithPhoneStates {}

// class SendOtpCodeSuccessState extends LoginWithPhoneStates {}

// class SendOtpCodeErrorState extends LoginWithPhoneStates {
//   final String error;
//   SendOtpCodeErrorState(this.error);
// }

class VerifyPhoneLoadingState extends LoginWithPhoneStates {}

class VerifyPhoneSuccessState extends LoginWithPhoneStates {}

class VerifyPhoneErrorState extends LoginWithPhoneStates {
  final String error;
  VerifyPhoneErrorState(this.error);
}

class SelectedCountryChangesSuccessState extends LoginWithPhoneStates {
  final Country selectedCountry;
  final Country value;

  SelectedCountryChangesSuccessState(this.selectedCountry, this.value);
}
