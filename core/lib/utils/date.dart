import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat("dd MMM yyyy").format(date);
}

String formatTime(DateTime date) {
  return DateFormat("HH:mm").format(date);
}

DateTime strToDate(String date) => DateTime.parse(date);

extension WIBDate on DateTime {
  DateTime toWIB() => add(const Duration(hours: 7));
}
