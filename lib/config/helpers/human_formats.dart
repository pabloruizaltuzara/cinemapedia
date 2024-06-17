import 'package:intl/intl.dart';

class HumanFormats {
  //lo de los corchetes es que si quiero madno un valor y sino por defecto tomara el valor de 0
  static String number(double number,[int decimal=0]) {
    final formatterNumber =
        NumberFormat.compactCurrency(decimalDigits: decimal, symbol: '', locale: 'en')
            .format(number);

    return formatterNumber;
  }
}
