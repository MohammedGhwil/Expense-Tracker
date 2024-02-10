import 'package:expense_tracker/Util/ExpenseTile.dart';
import 'package:expense_tracker/pages/ExpenseChart.dart';
import 'package:expense_tracker/pages/Model/Expenses.dart';
import 'package:expense_tracker/pages/expensesdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({super.key});

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  final newexpenseCategorycontroller = TextEditingController();
  final newexpenseAmountcontroller = TextEditingController();
  void AddNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add Expense"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: newexpenseCategorycontroller,
                      decoration: const InputDecoration(hintText: "Category")),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Amount"),
                    controller: newexpenseAmountcontroller,
                  )
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: save,
                  child: Text("Save Expense"),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: Text("Cancel"),
                )
              ],
            ));
  }

  void save() {
    ExpenseItem newexpnese = ExpenseItem(
        name: newexpenseCategorycontroller.text,
        amount: newexpenseAmountcontroller.text,
        dateAdded: DateTime.now());
    Provider.of<ExpensesData>(context, listen: false).addExpense(newexpnese);
    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newexpenseAmountcontroller.clear();
    newexpenseCategorycontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesData>(
      builder: (context, value, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: AddNewExpense, child: Icon(Icons.add)),
          backgroundColor: Color(0xff252634),
          appBar: AppBar(
              elevation: 0,
              title: Text(
                "Expensify",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xff252634),
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.logout_rounded),
                ),
              ]),
          body: ListView(
            children: [
              ExpenseChart(startofweek: value.startofweek()),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.AllExpenseslist().length,
                itemBuilder: (context, index) => ExpenseTiles(
                    name: value.AllExpenseslist()[index].name,
                    amount: value.AllExpenseslist()[index].amount,
                    dateTime: value.AllExpenseslist()[index].dateAdded),
              )
            ],
          )),
    );
  }
}
