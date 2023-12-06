import 'package:expense_tracker/pages/Model/SignupModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Util/Button.dart';
import 'package:expense_tracker/Util/textinput.dart';

class SignupView extends StatefulWidget {
  final Function()? onTap;

  const SignupView({Key? key, required this.onTap}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final SignupModel model = SignupModel();

  void signupUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        );
      },
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      ErrorMessage("Passwords Do Not Match");
      return;
    }

    try {
      await model.createUserWithEmailAndPassword(
        usernameController.text,
        passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ErrorMessage(e.code);
    }
  }

  void ErrorMessage(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

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
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  Image.asset('lib/icons/login-xxl.png', height: 50),
                  const SizedBox(height: 25),
                  Text(
                    'Welcome to TestName',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 25),
                  textinput(
                    controller: usernameController,
                    hintText: 'Enter Your Email',
                    concealText: false,
                  ),
                  const SizedBox(height: 30),
                  textinput(
                    controller: passwordController,
                    hintText: 'Enter Your Password',
                    concealText: true,
                  ),
                  const SizedBox(height: 30),
                  textinput(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Your Password',
                    concealText: true,
                  ),
                  const SizedBox(height: 30),
                  GenButton(onTap: signupUser, description: "Sign Up"),
                  const SizedBox(height: 190),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a Member? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
