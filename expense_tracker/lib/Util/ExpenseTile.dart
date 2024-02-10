import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTiles extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;
  ExpenseTiles(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
          )
        ],
      ),
      child: ListTile(
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
      ),
    );
  }
}
