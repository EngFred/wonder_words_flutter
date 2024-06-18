import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wonder_words/core/navigation/routes_generator.dart';
import 'package:wonder_words/core/utils/utils.dart';
import 'package:wonder_words/features/auth/presentation/bloc/auth_events.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_button.dart';
import 'package:wonder_words/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:validators/validators.dart' as validator;

import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _errorSnackbarShown = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppbar(
        title: "Sign up",
        onClose: () {
          //SystemNavigator.pop();
        },
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
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
                      _nameController.text = value;
                    });
                  },
                  icon: Icons.person,
                  controller: _nameController,
                  hintText: "Username",
                  isPassword: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  onValueChanged: (value) {
                    setState(() {
                      _emailController.text = value;
                    });
                  },
                  controller: _emailController,
                  hintText: "Email",
                  isPassword: false,
                ),
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
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  onValueChanged: (value) {
                    setState(() {
                      _confirmPasswordController.text = value;
                    });
                  },
                  controller: _confirmPasswordController,
                  hintText: "Confirm password",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildAuthButton(context, state),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Already have an account?"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RoutesGenerator.loginPage);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
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
      return _signupButton(context);
    } else {
      return _signupButton(context);
    }
  }

  Widget _signupButton(BuildContext context) {
    return AuthButton(
      onClick: () {
        if (_nameController.text.isNotEmpty &&
            _emailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty &&
            _confirmPasswordController.text.isNotEmpty) {
          if (_nameController.text.length < 3) {
            showCustomSnackBar(context, "The username is too short!");
          } else {
            if (validator.isEmail(_emailController.text.trim())) {
              if (_passwordController.text.length >= 6) {
                if (_passwordController.text.trim() ==
                    _confirmPasswordController.text.trim()) {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignupButtonClicked(
                      username: _nameController.text.trim(),
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  );
                } else {
                  showCustomSnackBar(context, "Passwords don't match!");
                }
              } else {
                showCustomSnackBar(context, "Password is too short!");
              }
            } else {
              showCustomSnackBar(context, "The email is invalid!");
            }
          }
        } else {
          showCustomSnackBar(context, "Some fields are missing");
        }
      },
      label: "Signup",
      icon: Icons.login,
    );
  }
}
