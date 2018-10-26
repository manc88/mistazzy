import 'package:intl/intl.dart';

class Dt {
  static String topicDate(DateTime d) {
    var formatter = DateFormat('dd.MM.yy   HH:mm');
    return formatter.format(d);
  }
}
