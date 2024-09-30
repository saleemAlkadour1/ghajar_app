extension ExtensionIntHelpers on int {
  String get toOrdinal {
    int number = this;
    if (number < 0) throw Exception('Invalid Number');
    switch (number) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  bool isBetween(int min, int max) {
    return this > min && this < max;
  }
}
/*
* var s = PlatformUtils.localeCode;
    s = s== 'ar' ? 'ar_EG' : s;
    print('=====> ${s}');
    var format = NumberFormat.currency(locale: s);
    print(format.format(22));
    var f = NumberFormat('###.0#', s);
    print(f.format(12.345));
*
* */
