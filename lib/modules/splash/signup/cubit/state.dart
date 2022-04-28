
abstract class RegisterStates {}

class Empty extends RegisterStates {}

class UserRegisterLoading extends RegisterStates {}

class UserRegisterSuccess extends RegisterStates {}

class UserRegisterError extends RegisterStates {

}

class ChangePasswordVisibilityState extends RegisterStates {}
