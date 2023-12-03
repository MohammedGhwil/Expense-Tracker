import 'dart:ffi';

import 'package:expense_tracker/Util/Button.dart';
import 'package:expense_tracker/Util/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final usernameController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  Future ResetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usernameController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Check Your Email For A Reset Link"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffe69bef), Color(0xff94ccff)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 223, 59, 241),
                  Color.fromARGB(255, 70, 165, 255)
                ])),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Enter Your Account\'s Email'),
          SizedBox(height: 10),
          textinput(
            controller: usernameController,
            hintText: 'Enter Your Email',
            concealText: false,
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: ResetPassword,
            child: Text('Reset Password'),
            color: Color.fromARGB(255, 255, 255, 255),
          )
        ]),
      ),
    );
  }
}
