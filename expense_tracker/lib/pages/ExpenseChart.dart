import 'package:expense_tracker/Util/barGraph.dart';
import 'package:expense_tracker/pages/Date_Time_Helper/DateTimeHelper.dart';
import 'package:expense_tracker/pages/expensesdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseChart extends StatelessWidget {
  final DateTime startofweek;
  const ExpenseChart({super.key, required this.startofweek});

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startofweek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startofweek.add(Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startofweek.add(Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startofweek.add(Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startofweek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startofweek.add(Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startofweek.add(Duration(days: 6)));
    return Consumer<ExpensesData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: BarGraph(
            maxY: 100,
            sunamount: value.calculateDailyExpenses()[sunday] ?? 0,
            monamount: value.calculateDailyExpenses()[monday] ?? 0,
            tueamount: value.calculateDailyExpenses()[tuesday] ?? 0,
            wedamount: value.calculateDailyExpenses()[wednesday] ?? 0,
            thuramount: value.calculateDailyExpenses()[thursday] ?? 0,
            friamount: value.calculateDailyExpenses()[friday] ?? 0,
            satamount: value.calculateDailyExpenses()[saturday] ?? 0),
      ),
    );
  }
}
