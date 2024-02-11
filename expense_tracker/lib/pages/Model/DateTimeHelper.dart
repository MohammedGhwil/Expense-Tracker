String convertDateTimeToString(DateTime date) {
  String year = date.year.toString();
  String month = date.month.toString();
  if (month.length == 1) {
    month = '0' + month;
  }
  String day = date.day.toString();
  if (day.length == 1) {
    day = '0' + day;
  }
  String YYYYMMDD = year + month + day;
  return YYYYMMDD;
}
