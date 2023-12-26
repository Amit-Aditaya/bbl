class StringToDate {
  static DateTime convertStringToDate(String str) {
    String strDate = str.substring(0, 2);
    int dd = int.parse(strDate);
    String strMonth = str.substring(3, 5);
    int mm = int.parse(strMonth);
    String strYear = str.substring(6, 10);
    int yy = int.parse(strYear);
    DateTime dateTime = DateTime(yy, mm, dd);
    return dateTime;
  }
}
