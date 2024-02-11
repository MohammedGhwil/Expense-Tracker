import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_tracker/pages/Model/Expenses.dart';

class hiveDataBase {
  final _mybox = Hive.box("Expenses_database");

  void savedata(List<ExpenseItem> allexpense) {
    List<List<dynamic>> Allexpensesformatted = [];
    for (var expense in allexpense) {
      List<dynamic> expenseformatted = [
        expense.name,
        expense.amount,
        expense.dateAdded,
      ];
      Allexpensesformatted.add(expenseformatted);
      _mybox.put("AllExpenses", Allexpensesformatted);
    }
  }

  List<ExpenseItem> readdata() {
    List SavedExpenses = _mybox.get("AllExpenses") ?? [];
    List<ExpenseItem> allexpenses = [];
    for (int i = 0; i < SavedExpenses.length; i++) {
      String name = SavedExpenses[i][0];
      String amount = SavedExpenses[i][1];
      DateTime date = SavedExpenses[i][2];
      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateAdded: date);
      allexpenses.add(expense);
    }
    return allexpenses;
  }
}
