import 'dart:ui' as ui show Color;

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');

  bool isDigit() {
    var s = this;
    if (s.isEmpty) {
      return false;
    }
    if (s.length > 1) {
      for (var r in s.runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return s.runes.first ^ 0x30 <= 9;
    }
  }

  bool get isUrl => (contains('https://') || contains('http://'));

  bool hasStartEnd(String start, String end) {
    return startsWith(start) && endsWith(end);
  }

  String get brToNewLine {
    Pattern pattern = RegExp("<br>|<br />");
    return replaceAll(pattern, '\n');
  }

  String get clearLogPassword {
    return replaceAll(RegExp(r'password->\w+'), 'password->****')
        .replaceAll(RegExp(r'password_confirmation->\w+'), 'password_confirmation->****');
  }

  String beforeLast(String character) {
    final String tmpValue = this;
    final pos = tmpValue.lastIndexOf(character);
    return (pos != -1) ? tmpValue.substring(0, pos) : tmpValue;
  }

  String beforeFirst(String character) {
    final String tmpValue = this;
    final pos = tmpValue.indexOf(character);
    return (pos != -1) ? tmpValue.substring(0, pos) : tmpValue;
  }

  String afterFirst(String character) {
    final String tmpValue = this;
    final pos = tmpValue.indexOf(character);
    return (pos != -1)
        ? (tmpValue.substring(pos, tmpValue.length).replaceFirst(character, ''))
        : tmpValue;
  }

  String afterLast(String character) {
    final String tmpValue = this;
    final pos = tmpValue.lastIndexOf(character);
    return (pos != -1)
        ? (tmpValue.substring(pos, tmpValue.length).replaceFirst(character, ''))
        : tmpValue;
  }

  ui.Color get getColorFromHex {
    String hexString = this;
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return ui.Color(int.parse(buffer.toString(), radix: 16));
  }

  int get hexToInt {
    String hex = replaceFirst('#', '');
    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException("Invalid hexadecimal value");
      }
    }
    return val;
  }

  String get ucFirst {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return toUpperCase();
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
