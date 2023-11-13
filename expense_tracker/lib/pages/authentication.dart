import 'package:expense_tracker/pages/HomeScreen.dart';
import 'package:expense_tracker/pages/LoginOrSignup.dart';
import 'package:expense_tracker/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Homescreen();
              } else {
                return LoginOrSignUp();
              }
            }));
  }
}
