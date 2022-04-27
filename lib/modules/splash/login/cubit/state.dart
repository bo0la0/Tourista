
abstract class LoginStates {}

class Empty extends LoginStates {}

class UserLoginLoading extends LoginStates {}

class UserLoginSuccess extends LoginStates {}

class UserLoginError extends LoginStates {

}

class ChangePasswordVisibilityState extends LoginStates {}
