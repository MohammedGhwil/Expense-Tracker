import 'package:expense_tracker/Util/Button.dart';
import 'package:expense_tracker/Util/textinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final Function()? onTap;
  const Signup({super.key, required this.onTap});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernameController = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confrimpasswordcontroller = TextEditingController();
  //signing User up method

  void signupUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    const Color.fromARGB(255, 255, 255, 255))),
          );
        });
    if (passwordcontroller.text != confrimpasswordcontroller.text) {
      Navigator.pop(context);
      ErrorMessage("Passwords Do Not Match");
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                  //password confirmation
                  const SizedBox(height: 30),
                  textinput(
                    controller: confrimpasswordcontroller,
                    hintText: 'Confirm Your Password',
                    concealText: true,
                  ),
                  //sign in
                  const SizedBox(height: 30),
                  GenButton(onTap: signupUser, description: "Sign Up"),

                  //sign up
                  const SizedBox(height: 190),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a Member? "),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text("Log In",
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
