part of 'delibird_app_cubit.dart';

abstract class DelibirdAppStates {}

class DelibirdAppInitialState extends DelibirdAppStates {}

class ChangeBottomNavState extends DelibirdAppStates {}

class GetUserLoadingState extends DelibirdAppStates {}

class GetUserSuccessState extends DelibirdAppStates {}

class GetUserErrorState extends DelibirdAppStates {
  final String error;
  GetUserErrorState(this.error);
}

class SignOutSuccessState extends DelibirdAppStates {}

class SignOutErrorState extends DelibirdAppStates {
  final String error;
  SignOutErrorState(this.error);
}
