import 'dart:ui' show Color;

import 'package:flutter/material.dart' show ThemeMode;
import 'package:recase/recase.dart';

extension ExtensionMaterialThemeBooleans on ThemeMode {
  bool get isSystem => this == ThemeMode.system;

  bool get isLight => this == ThemeMode.light;

  bool get isDark => this == ThemeMode.dark;

  String stringSwitcher(String light, String dark) {
    return isLight ? light : dark;
  }

  Color colorSwitcher(Color lightColor, Color darkColor) {
    return isLight ? lightColor : darkColor;
  }

  Color intSwitcher(Color lightColor, Color darkColor) {
    return isLight ? lightColor : darkColor;
  }
}

extension ExtensionMaterialTheme on Iterable<ThemeMode> {
  ThemeMode fromString(String value) {
    return firstWhere(
      (th) => th.name == value.snakeCase,
      orElse: () => ThemeMode.system,
    );
  }
}
