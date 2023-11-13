import 'package:expense_tracker/Util/Button.dart';
import 'package:expense_tracker/Util/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();

  final passwordcontroller = TextEditingController();

  //signing User In method

  void signInUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    const Color.fromARGB(255, 255, 255, 255))),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordcontroller.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ErrorMessage(e.code);
    }
  }

  void ErrorMessage(String errormessage) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              title: Center(
                  child: Text(errormessage,
                      style: const TextStyle(color: Colors.black))));
        });
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
            body: SafeArea(
                child: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  //icon
                  const SizedBox(height: 120),
                  Image.asset('lib/icons/login-xxl.png', height: 50),
                  const SizedBox(height: 25),
                  Text('Welcome to TestName',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  const SizedBox(height: 25),
                  //username
                  textinput(
                    controller: usernameController,
                    hintText: 'Enter Your Email',
                    concealText: false,
                  ),
                  //password
                  const SizedBox(height: 30),
                  textinput(
                    controller: passwordcontroller,
                    hintText: 'Enter Your Password',
                    concealText: true,
                  ),
                  //sign in
                  const SizedBox(height: 30),
                  GenButton(onTap: signInUser, description: "Sign In"),

                  //sign up
                  const SizedBox(height: 260),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New Member? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ]),
              ),
            ))));
  }
}
