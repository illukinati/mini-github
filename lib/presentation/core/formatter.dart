import 'package:intl/intl.dart' show NumberFormat;

class MyFormatter {
  static String numberFormatter(int num) {
    final formatter = NumberFormat('#,###');
    return formatter.format(num);
  }
}
