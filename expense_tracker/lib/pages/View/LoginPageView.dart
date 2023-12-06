import 'package:expense_tracker/pages/Model/login_pageModel.dart';
import 'package:expense_tracker/pages/View/ForgotPasswordView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Util/Button.dart';
import 'package:expense_tracker/Util/textinput.dart';

class LoginView extends StatefulWidget {
  final Function()? onTap;

  const LoginView({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginModel model = LoginModel();

  void signInUser() async {
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

    try {
      await model.signInWithEmailAndPassword(
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Assuming ForgotPasswordView is the correct class for forgot password
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordView(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GenButton(onTap: signInUser, description: "Sign In"),
                  const SizedBox(height: 260),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New Member? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign Up",
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
