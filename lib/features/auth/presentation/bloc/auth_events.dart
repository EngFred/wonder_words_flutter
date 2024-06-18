abstract class AuthEvents {}

class LoginButtonClicked extends AuthEvents {
  final String login;
  final String password;

  LoginButtonClicked({required this.login, required this.password});
}

class SignupButtonClicked extends AuthEvents {
  final String username;
  final String email;
  final String password;

  SignupButtonClicked(
      {required this.username, required this.email, required this.password});
}
