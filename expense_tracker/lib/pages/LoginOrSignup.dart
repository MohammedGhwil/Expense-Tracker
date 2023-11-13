import 'package:expense_tracker/pages/SignUp.dart';
import 'package:expense_tracker/pages/login_page.dart';
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
      return Login(
        onTap: toggleSignUp,
      );
    } else {
      return Signup(
        onTap: toggleSignUp,
      );
    }
  }
}
