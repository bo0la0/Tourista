
abstract class RegisterStates {}

class Empty extends RegisterStates {}

class UserRegisterLoading extends RegisterStates {}

class UserRegisterSuccess extends RegisterStates {}

class UserRegisterError extends RegisterStates {
  final String error;
  UserRegisterError(this.error);

}

class CreateUserSuccess extends RegisterStates {
  final String uId;

  CreateUserSuccess(this.uId);
}

class CreateUserError extends RegisterStates {
  final String error;

  CreateUserError(this.error);
}
class ChangePasswordVisibilityState extends RegisterStates {}

