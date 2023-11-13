import 'package:flutter/material.dart';

class textinput extends StatelessWidget {
  final controller;
  final String hintText;
  final bool concealText;

  const textinput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.concealText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
          obscureText: concealText,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              fillColor: Color.fromARGB(255, 228, 224, 224),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]))),
    );
  }
}
