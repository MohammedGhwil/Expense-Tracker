import 'package:flutter/material.dart';

class GenButton extends StatelessWidget {
  final Function()? onTap;
  final String description;
  const GenButton({super.key, required this.onTap, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 223, 59, 241),
                Color.fromARGB(255, 70, 165, 255)
              ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
