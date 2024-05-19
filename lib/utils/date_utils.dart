class DateUtils{
  static String DateTimeToString({
    required DateTime dateTime,
}) {
    return '${dateTime.year} - ${padInterger(number: dateTime.month)} - ${padInterger(number: dateTime.day)} ${padInterger(number: dateTime.hour)}:00';
  }

  static String padInterger({
  required int number,
}){
    return number.toString().padLeft(2, '0');
  }
}