import 'package:expense_tracker/pages/View/LoginPageView.dart';
import 'package:expense_tracker/pages/View/SignupView.dart';
import 'package:flutter/material.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  bool displayLogin = true;

  void toggleSignUp() {
    setState(() {
      displayLogin = !displayLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (displayLogin) {
      return LoginView(
        onTap: toggleSignUp,
      );
    } else {
      return SignupView(
        onTap: toggleSignUp,
      );
    }
  }
}
