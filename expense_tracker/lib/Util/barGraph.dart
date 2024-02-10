import 'package:expense_tracker/Util/bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuramount;
  final double friamount;
  final double satamount;
  const BarGraph(
      {super.key,
      required this.maxY,
      required this.sunamount,
      required this.monamount,
      required this.tueamount,
      required this.wedamount,
      required this.thuramount,
      required this.friamount,
      required this.satamount});

  @override
  Widget build(BuildContext context) {
    bardata barchardata = bardata(
        sunamount: sunamount,
        monamount: monamount,
        tueamount: tueamount,
        wedamount: wedamount,
        thuramount: thuramount,
        friamount: friamount,
        satamount: satamount);
    barchardata.initializedata();
    return BarChart(BarChartData(
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getbottomtitles))),
      maxY: maxY,
      minY: 0,
      barGroups: barchardata.barData
          .map(
            (data) => BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                  toY: data.y,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  width: 20,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      color: Color.fromARGB(255, 50, 51, 61),
                      toY: maxY))
            ]),
          )
          .toList(),
    ));
  }
}

Widget getbottomtitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "Sun",
        style: style,
      );
    case 1:
      text = const Text(
        "Mon",
        style: style,
      );
    case 2:
      text = const Text(
        "Tue",
        style: style,
      );
    case 3:
      text = const Text(
        "Wed",
        style: style,
      );
    case 4:
      text = const Text(
        "Thur",
        style: style,
      );
    case 5:
      text = const Text(
        "Fri",
        style: style,
      );
    case 6:
      text = const Text(
        "Sat",
        style: style,
      );
      break;
    default:
      text = const Text("");
  }
  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
  );
}
