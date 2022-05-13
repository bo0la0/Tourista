
abstract class LoginStates {}

class Empty extends LoginStates {}

class UserLoginLoading extends LoginStates {}

class UserLoginSuccess extends LoginStates {
  final String uId;

  UserLoginSuccess(this.uId);

}

class UserLoginError extends LoginStates {
  final String error;

  UserLoginError(this.error);

}

class ChangePasswordVisibilityState extends LoginStates {}

class UserLoginSuccessWithGoogle extends LoginStates{}
class UserSignOutGoogle extends LoginStates{}
