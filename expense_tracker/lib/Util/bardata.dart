import 'package:expense_tracker/Util/bar.dart';

class bardata {
  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuramount;
  final double friamount;
  final double satamount;

  bardata(
      {required this.sunamount,
      required this.monamount,
      required this.tueamount,
      required this.wedamount,
      required this.thuramount,
      required this.friamount,
      required this.satamount});
  List<IndividualBar> barData = [];
  void initializedata() {
    barData = [
      IndividualBar(x: 0, y: sunamount),
      IndividualBar(x: 1, y: monamount),
      IndividualBar(x: 2, y: tueamount),
      IndividualBar(x: 3, y: wedamount),
      IndividualBar(x: 4, y: thuramount),
      IndividualBar(x: 5, y: friamount),
      IndividualBar(x: 6, y: satamount),
    ];
  }
}
