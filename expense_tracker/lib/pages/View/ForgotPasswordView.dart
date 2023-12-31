import 'package:expense_tracker/pages/Model/ForgotPasswordModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Util/textinput.dart';

class ForgotPasswordView extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final ForgotPasswordModel model = ForgotPasswordModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffe69bef), Color(0xff94ccff)],
        ),
      ),
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
                  Color.fromARGB(255, 70, 165, 255),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Your Account\'s Email'),
            SizedBox(height: 10),
            textinput(
              controller: usernameController,
              hintText: 'Enter Your Email',
              concealText: false,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () async {
                try {
                  await model.resetPassword(usernameController.text.trim());
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Check Your Email For A Reset Link"),
                      );
                    },
                  );
                } on FirebaseAuthException catch (e) {
                  print(e);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(e.message.toString()),
                      );
                    },
                  );
                }
              },
              child: Text('Reset Password'),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
