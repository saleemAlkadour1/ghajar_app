import 'package:intl/intl.dart';

extension MyDateUtils on DateTime {
  DateTime resetTime() {
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  String get fullFormat {
    return DateFormat('EEEE MMMM d, yyyy').format(this);
  }

  String get formatShortDate {
    return DateFormat('y-MM-d').format(this);
  }

  String get dayMonthYearFormat {
    return DateFormat('d MMMM yyyy').format(this);
  }

  static DateTime timeZero() {
    return DateTime.fromMicrosecondsSinceEpoch(0);
  }

  bool get isToday {
    final DateTime other = DateTime.now();
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameDate(DateTime? other) {
    if (other == null) {
      return false;
    }
    return resetTime().isAtSameMomentAs(other.resetTime());
  }

  DateTime setTimeFromString(String time) {
    int? hours;
    int? minutes;
    int? seconds;
    if (time.contains(':')) {
      List<String> timeParts = time.split(':');
      hours = int.tryParse(timeParts[0]);
      minutes = int.tryParse(timeParts[1]);
      if (timeParts.length > 2) {
        seconds = int.tryParse(timeParts[2]);
      }
    }
    return copyWith(hour: hours, minute: minutes, second: seconds);
  }
}
