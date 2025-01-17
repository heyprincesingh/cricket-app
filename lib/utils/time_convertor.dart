import 'package:intl/intl.dart';

String convertTimestampToIST(String timestampStr) {
  int timestamp = int.tryParse(timestampStr) ?? 0;
  DateTime dateTimeUtc = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

  DateTime dateTimeIST = dateTimeUtc.add(const Duration(hours: 5, minutes: 30));

  String formattedDate = DateFormat("MMM dd, yyyy hh:mm a").format(dateTimeIST);

  return formattedDate;
}
