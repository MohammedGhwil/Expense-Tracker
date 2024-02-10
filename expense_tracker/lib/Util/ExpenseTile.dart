import 'package:flutter/material.dart';

class ExpenseTiles extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  const ExpenseTiles(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        dateTime.day.toString() +
            '/' +
            dateTime.month.toString() +
            '/' +
            dateTime.year.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing:
          Text("L.E" + amount, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
