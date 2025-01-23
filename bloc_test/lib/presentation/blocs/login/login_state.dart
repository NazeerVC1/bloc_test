import 'package:bloc_test/data/models/login_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginInvalidCredentials extends LoginState {
  final String message;
  LoginInvalidCredentials(this.message);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});
}
