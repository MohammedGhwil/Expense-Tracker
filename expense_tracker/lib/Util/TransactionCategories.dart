import 'package:flutter/material.dart';

class TransactionCategory extends StatefulWidget {
  const TransactionCategory({super.key});

  @override
  State<TransactionCategory> createState() => _TransactionCategoryState();
}

class _TransactionCategoryState extends State<TransactionCategory> {
  var Category = "Groceries";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: [
          DropdownMenuItem(child: Text("Groceries"), value: "Groceries"),
          DropdownMenuItem(child: Text("Rent"), value: "Rent"),
          DropdownMenuItem(child: Text("Dining"), value: "Dining"),
          DropdownMenuItem(child: Text("Car payment"), value: "Car payment"),
          DropdownMenuItem(child: Text("Bills"), value: "Bills"),
          DropdownMenuItem(child: Text("Insurance"), value: "Insurance"),
          DropdownMenuItem(child: Text("Other"), value: "Other"),
        ],
        onChanged: (value) {
          if (value != null) {
            setState(() {
              Category = value;
            });
          }
        });
  }
}
