import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_words/core/navigation/routes_generator.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_events.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_state.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_button.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_text_field.dart';

import '../../../../core/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _errorSnackbarShown = false;

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppbar(
          title: "Login",
          onClose: () {
            //SystemNavigator.pop();
          }),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthError && !_errorSnackbarShown) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showCustomSnackBar(context, state.errorMessage);
              _errorSnackbarShown = true; // Set to true after showing Snackbar
            });
          } else if (state is! AuthError) {
            _errorSnackbarShown = false; // Reset when state is not AuthError
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextField(
                      onValueChanged: (value) {
                        setState(() {
                          _loginController.text = value;
                        });
                      },
                      controller: _loginController,
                      icon: Icons.person,
                      hintText: "Username or email",
                      isPassword: false),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                      onValueChanged: (value) {
                        setState(() {
                          _passwordController.text = value;
                        });
                      },
                      controller: _passwordController,
                      hintText: "Password",
                      isPassword: true),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RoutesGenerator.forgotPasswordPage);
                          },
                          child: const Text("Forgot password?"))),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildAuthButton(context, state),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Don't have an account?"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(RoutesGenerator.signupPage);
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAuthButton(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      return Container(
        height: 55,
        width: 55,
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    } else if (state is AuthSuccess) {
      // Delay the navigation until after the current frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesGenerator.homePage, (Route<dynamic> route) => false);
      });
      return Container(
        height: 55,
        width: 55,
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.black,
        ),
      );
    } else if (state is AuthError) {
      return _loginButton(context);
    } else {
      return _loginButton(context);
    }
  }

  Widget _loginButton(BuildContext context) {
    return AuthButton(
      onClick: () {
        if (_loginController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          {
            BlocProvider.of<AuthBloc>(context).add(
              LoginButtonClicked(
                login: _loginController.text.trim(),
                password: _passwordController.text.trim(),
              ),
            );
          }
        } else {
          showCustomSnackBar(context, "Some fields are missing");
        }
      },
      label: "Login",
      icon: Icons.login,
    );
  }
}
