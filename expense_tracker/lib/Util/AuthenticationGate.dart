import 'package:expense_tracker/pages/Dashboard.dart';
import 'package:expense_tracker/pages/LogInPage.dart';
import 'package:expense_tracker/pages/View/HomescreenView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoginPage();
          }
          return HomescreenView();
        });
  }
}
