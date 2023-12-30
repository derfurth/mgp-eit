import 'package:date_format/date_format.dart';

class TimeUtils {
  static millisToFrench(num millisecondsSinceEpoch) => formatDate(
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch.toInt()),
      [dd, '/', mm, '/', yy]);

  static timestampToFrench(String? timestamp) => timestamp == null
      ? '-'
      : formatDate(DateTime.parse(timestamp), [dd, '/', mm, '/', yy]);
}
