import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime date,
      {String format = 'dd/MM/yyyy hh:mm a'}) {
    return DateFormat(format).format(date);
  }
}
