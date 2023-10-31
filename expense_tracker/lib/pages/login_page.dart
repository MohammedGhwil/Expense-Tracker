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
                child: Center(
              child: Column(children: [
                //icon
                const SizedBox(height: 120),
                Image.asset('lib/icons/login-xxl.png', height: 50),
                const SizedBox(height: 50),
                //username
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)))),
                )
                //password

                //log in
              ]),
            ))));
  }
}
