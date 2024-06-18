String extractYear(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String year = dateTime.year.toString();
  return year;
}
