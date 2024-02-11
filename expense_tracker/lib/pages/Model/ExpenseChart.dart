import 'dart:math';

import 'package:expense_tracker/Util/barGraph.dart';
import 'package:expense_tracker/pages/Date_Time_Helper/DateTimeHelper.dart';
import 'package:expense_tracker/pages/expensesdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseChart extends StatelessWidget {
  final DateTime startofweek;
  const ExpenseChart({super.key, required this.startofweek});

  double calculateMax(
    ExpensesData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenses()[sunday] ?? 0,
      value.calculateDailyExpenses()[monday] ?? 0,
      value.calculateDailyExpenses()[tuesday] ?? 0,
      value.calculateDailyExpenses()[wednesday] ?? 0,
      value.calculateDailyExpenses()[thursday] ?? 0,
      value.calculateDailyExpenses()[friday] ?? 0,
      value.calculateDailyExpenses()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateweektotal(
    ExpensesData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenses()[sunday] ?? 0,
      value.calculateDailyExpenses()[monday] ?? 0,
      value.calculateDailyExpenses()[tuesday] ?? 0,
      value.calculateDailyExpenses()[wednesday] ?? 0,
      value.calculateDailyExpenses()[thursday] ?? 0,
      value.calculateDailyExpenses()[friday] ?? 0,
      value.calculateDailyExpenses()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toString();
  }

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
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Text(
                  "Total Expenses ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                    "L.E " +
                        calculateweektotal(value, sunday, monday, tuesday,
                            wednesday, thursday, friday, saturday),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white))
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: BarGraph(
                maxY: calculateMax(value, sunday, monday, tuesday, wednesday,
                    thursday, friday, saturday),
                sunamount: value.calculateDailyExpenses()[sunday] ?? 0,
                monamount: value.calculateDailyExpenses()[monday] ?? 0,
                tueamount: value.calculateDailyExpenses()[tuesday] ?? 0,
                wedamount: value.calculateDailyExpenses()[wednesday] ?? 0,
                thuramount: value.calculateDailyExpenses()[thursday] ?? 0,
                friamount: value.calculateDailyExpenses()[friday] ?? 0,
                satamount: value.calculateDailyExpenses()[saturday] ?? 0),
          ),
        ],
      ),
    );
  }
}
