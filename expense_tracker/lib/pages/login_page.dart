import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              child: Column(children: [
                //icon
                Align(
                    alignment: const Alignment(0, -0.30),
                    child: Image.asset(
                      'lib/icons/login-xxl.png',
                      width: 50,
                    ))

                //username

                //password

                //log in
              ]),
            )));
  }
}
