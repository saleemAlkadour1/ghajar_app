import 'package:flutter/material.dart';

abstract class AppColors {
  //Application definitions
  static const Color primary = Color(0XFF1373BA);
  static const Color bg = Color(0XFFF5F6F7);
  static const Color text = Color(0xFF000000);
  static const Color lightText = Color(0xFF484C52);
  static const Color xlightText = Color(0xFF95959D);
  static const Color xXLightText = Color(0xFFA4ACAD);
  static const Color pageViewNav = Color(0xFF415DA5);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color lightBlack = Color(0xFF141F1F);
  static const Color titleNavigationBottom = Color(0xFF1474BA);
  static const Color rating = Color(0xFFF3D000);
  static const Color priceDetails = Color(0xFF979C9E);
  static const Color description = Color(0xFF797676);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final HSLColor hsl = HSLColor.fromColor(color);
    final HSLColor hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  // static const Gradient colorsPrimaryGradient = LinearGradient(
  //   colors: [primary, primaryLight],
  //   begin: AlignmentDirectional.topCenter,
  //   end: AlignmentDirectional.centerEnd,
  // );
}
