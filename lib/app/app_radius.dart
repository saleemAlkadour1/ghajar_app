import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRadius {
  final double _radius;

  AppRadius._(this._radius);
//Application definitions
  static AppRadius superLg = AppRadius._(100.0);
  static AppRadius lg = AppRadius._(20.0);
  static AppRadius xm = AppRadius._(15.0);
  static AppRadius m = AppRadius._(14.0);
  static AppRadius regular = AppRadius._(12.0);
  static AppRadius sm = AppRadius._(8.0);
  static AppRadius xs = AppRadius._(6.0);

//General definitions
  static AppRadius xxl = AppRadius._(40.0);
  static AppRadius xl = AppRadius._(30.0);

  double get v => _radius.r;

  double operator *(double x) {
    return _radius * x;
  }
}
