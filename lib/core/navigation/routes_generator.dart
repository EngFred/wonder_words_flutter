import 'package:flutter/material.dart';
import 'package:wonder_words/features/auth/presentation/pages/forgot_password.dart';
import 'package:wonder_words/features/auth/presentation/pages/login.dart';
import 'package:wonder_words/features/auth/presentation/pages/sign_up.dart';
import 'package:wonder_words/features/quotes/presentation/pages/home.dart';

import '../../features/details/presentation/pages/quote_details.dart';

class RoutesGenerator {
  static const String loginPage = '/';
  static const String signupPage = '/signup';
  static const String forgotPasswordPage = '/forgot_password';
  static const String homePage = '/home';
  static const String quoteDetailsPage = '/quote_details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case signupPage:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());

      case homePage:
        return MaterialPageRoute(builder: (_) => const Home());
      case quoteDetailsPage:
        if (settings.arguments is int) {
          final int quoteId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (_) => QuoteDetails(quoteId: quoteId),
          );
        }
        return _errorRoute();
      default:
        throw const FormatException("Route not found");
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Route not found'),
        ),
      ),
    );
  }
}
