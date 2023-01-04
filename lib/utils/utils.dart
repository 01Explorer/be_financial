import 'package:intl/intl.dart';

class Utils {
  String formatCurrencyBRL(double value) {
    return NumberFormat.currency(locale: 'pt_br', symbol: 'R\$')
        .format(value)
        .toString();
  }

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
