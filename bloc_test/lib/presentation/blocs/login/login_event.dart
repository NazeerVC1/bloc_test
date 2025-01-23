abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;
  // final bool rememberMe;
  final int languageId;

  LoginSubmitted(
      {required this.username,
      required this.password,
      // this.rememberMe,
      required this.languageId});
}

class PerformLogin extends LoginEvent {
  final Map<String, dynamic> loginData;
  PerformLogin(this.loginData);
}
