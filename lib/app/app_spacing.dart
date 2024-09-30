import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  static double spacingScreenHPadding = 16;
  final double _dimension;

  AppSpacing._(this._dimension);

  static AppSpacing xxl = AppSpacing._(35);
  static AppSpacing xl = AppSpacing._(30);
  static AppSpacing lg = AppSpacing._(25);
  static AppSpacing md = AppSpacing._(20);
  static AppSpacing sm = AppSpacing._(15);
  static AppSpacing xs = AppSpacing._(10);
  static AppSpacing xxs = AppSpacing._(5);
  static AppSpacing value(double dimension) => AppSpacing._(dimension);

  double get v => _dimension;

  double get w => _dimension.w;

  double get h => _dimension.h;

  SizedBox get square {
    return SizedBox.square(dimension: _dimension);
  }

  SizedBox get inRow {
    return SizedBox(width: _dimension.w);
  }

  SizedBox get inColumn {
    return SizedBox(height: _dimension.h);
  }

  SizedBox operator *(double x) {
    return SizedBox.square(dimension: (_dimension * x).sp);
  }

  SizedBox xInColumn(double x) {
    return SizedBox(height: (_dimension * x).h);
  }

  SizedBox xInRow(double x) {
    return SizedBox(height: (_dimension * x).w);
  }
}
