import 'package:expense_tracker/pages/Date_Time_Helper/DateTimeHelper.dart';
import 'package:expense_tracker/pages/Model/Expenses.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExpensesData extends ChangeNotifier {
  List<ExpenseItem> overallExpenseslist = [];
  List<ExpenseItem> AllExpenseslist() {
    return overallExpenseslist;
  }

  void addExpense(ExpenseItem NewExpense) {
    overallExpenseslist.add(NewExpense);
    notifyListeners();
  }

  void deleteExpense(ExpenseItem expense) {
    overallExpenseslist.remove(expense);
    notifyListeners();
  }

  String RetrieveDay(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Sunday";
      case 2:
        return "Monday";
      case 3:
        return "Tuesday";
      case 4:
        return "Wednesday";
      case 5:
        return "Thursday";
      case 6:
        return "Friday";
      case 7:
        return "Saturday";
      default:
        return "";
    }
  }

  DateTime startofweek() {
    DateTime? startofweek;
    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      if (RetrieveDay(today.subtract(Duration(days: i))) == 'Sunday') {
        startofweek = today.subtract(Duration(days: i));
      }
    }
    ;
    return startofweek!;
  }

  Map<String, double> calculateDailyExpenses() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseslist) {
      String date = convertDateTimeToString(expense.dateAdded);
      double amount = double.parse(expense.amount);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
