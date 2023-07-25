part of 'sign_up_view_cubit.dart';

abstract class SignUpViewStates {}

class SignUpViewInitialState extends SignUpViewStates {}

class SignUpLoadingState extends SignUpViewStates {}

class SignUpSuccessState extends SignUpViewStates {
  final String uId;
  SignUpSuccessState(this.uId);
}

class SignUpErrorState extends SignUpViewStates {
  final String error;
  SignUpErrorState(this.error);
}

class CreateUserSuccessState extends SignUpViewStates {}

class CreateUserErrorState extends SignUpViewStates {
  final String error;
  CreateUserErrorState(this.error);
}

class SwitchPassVisibleState extends SignUpViewStates {}

class SwitchConfirmPassVisibleState extends SignUpViewStates {}

class SelectedCountryChangesSuccessState extends SignUpViewStates {
  final Country selectedCountry;
  final Country value;

  SelectedCountryChangesSuccessState(this.selectedCountry, this.value);
}
