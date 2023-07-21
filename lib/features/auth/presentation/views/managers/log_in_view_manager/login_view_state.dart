abstract class LoginViewCubitStates {}

class LoginViewCubitInitialState extends LoginViewCubitStates {}

class LoginLoadingState extends LoginViewCubitStates {}

class LoginSuccessState extends LoginViewCubitStates {
  final String uId;
  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginViewCubitStates {
  final String error;
  LoginErrorState(this.error);
}

class SignInWithGoogleLoadingState extends LoginViewCubitStates {}

class SignInWithGoogleSuccessState extends LoginViewCubitStates {
  final String uId;
  SignInWithGoogleSuccessState(this.uId);
}

class SignInWithGoogleErrorState extends LoginViewCubitStates {
  final String error;
  SignInWithGoogleErrorState(this.error);
}
