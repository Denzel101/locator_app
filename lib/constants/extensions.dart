import 'package:intl/intl.dart';

extension StringExtension on String {
  String iSODateToHm() {
    final parsedDate = DateTime.parse(this);
    final formattedDate = DateFormat.Hm().format(parsedDate);
    return formattedDate;
  }
}
