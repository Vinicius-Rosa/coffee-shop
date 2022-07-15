import 'package:intl/intl.dart';

class Currency {
  String format(double amount) {
    Intl.defaultLocale = 'pt_BR';
    NumberFormat formatter = NumberFormat.simpleCurrency();

    return formatter.format(amount);
  }
}
