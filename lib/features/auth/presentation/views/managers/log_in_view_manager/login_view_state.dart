abstract class LoginViewStates {}

class LoginViewCubitInitialState extends LoginViewStates {}

class LoginLoadingState extends LoginViewStates {}

class LoginSuccessState extends LoginViewStates {
  final String uId;
  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginViewStates {
  final String error;
  LoginErrorState(this.error);
}

class SignInWithGoogleLoadingState extends LoginViewStates {}

class SignInWithGoogleSuccessState extends LoginViewStates {
  final String uId;
  SignInWithGoogleSuccessState(this.uId);
}

class SignInWithGoogleErrorState extends LoginViewStates {
  final String error;
  SignInWithGoogleErrorState(this.error);
}

class FirestoreSaveUserSuccessState extends LoginViewStates {}

class FirestoreSaveUserErrorState extends LoginViewStates {
  final String error;
  FirestoreSaveUserErrorState(this.error);
}

class SwitchPassVisibleState extends LoginViewStates {}
