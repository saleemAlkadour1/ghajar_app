import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBase {
  static Future<E> delayBySec<E>(int seconds, FutureOr<E> Function() computation) {
    return Future<E>.delayed(Duration(seconds: seconds), computation);
  }

  static Future<E> delayByMilliSec<E>(int milliseconds, FutureOr<E> Function() computation) {
    return Future<E>.delayed(Duration(milliseconds: milliseconds), computation);
  }

  static int nextInt(int min, int max) {
    final math.Random random = math.Random();
    return min + random.nextInt((max + 1) - min);
  }

  static E max<E extends num>(E a, E b) => math.max<E>(a, b);

  static E min<E extends num>(E a, E b) => math.min<E>(a, b);

  static int intForTablet(int trueInt, [int? defaultValue]) {
    // Todo(suheyl): [2024-08-26 - 8_59_a_m_] Update (689) to be real number. Google it.
    if (1.sw > 689) {
      return trueInt;
    }
    return defaultValue ?? trueInt;
  }

  static double doubleForTablet(int trueInt, [int? defaultValue]) {
    return intForTablet(trueInt, defaultValue).toDouble();
  }

  static double getAppBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static List<String> getHourList(Duration interval,
      [bool is24Format = false, int? startHour, int? endHour]) {
    List<String> dayTimeSlots = [];

    DateTime startTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, startHour ?? 0, 0);
    DateTime endTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, endHour ?? 23, 59);

    while (startTime.isBefore(endTime)) {
      String slot;
      final String minute = startTime.minute.toString().padLeft(2, '0');
      if (is24Format) {
        String hour = startTime.hour.toString().padLeft(2, '0');
        slot = '$hour:$minute';
      } else {
        String period = startTime.hour >= 12 ? 'PM' : 'AM';
        int hour =
            startTime.hour > 12 ? startTime.hour - 12 : (startTime.hour == 0 ? 12 : startTime.hour);
        slot = '${hour.toString().padLeft(2, '0')}:$minute $period';
      }
      // Add the slot to the array
      dayTimeSlots.add(slot);
      // Move to the next time slot
      startTime = startTime.add(interval);
    }

    return dayTimeSlots;
  }

  static dismissKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static callMethodBy(int maxCounter, VoidCallback method, [Duration? duration]) {
    duration ??= const Duration(milliseconds: 50);
    int counter = 1;
    Timer.periodic(duration, (Timer t) {
      method.call();

      counter++;
      if (counter >= maxCounter) {
        t.cancel();
      }
    });
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext ctx,
      {String? text, SnackBar? snackBar}) {
    if (snackBar != null) {
      return ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    }

    snackBar = SnackBar(
      content: Text(text ?? ''),
    );
    return ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }
}
