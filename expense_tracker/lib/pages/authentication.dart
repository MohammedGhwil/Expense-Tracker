import 'package:expense_tracker/pages/LoginOrSignup.dart';
import 'package:expense_tracker/pages/View/HomescreenView.dart';
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
                return HomescreenView();
              } else {
                return LoginOrSignUp();
              }
            }));
  }
}
