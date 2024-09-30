import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class InputDecorationThemes {
  static InputDecorationTheme get main {
    return InputDecorationTheme(
      constraints: const BoxConstraints(
        minHeight: 56,
      ),
      isDense: true,
      filled: true,
      fillColor: AppColors.white,
      hintStyle: MyText.body.reColorLightText.style,
      labelStyle: MyText.body.style,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.border),
      ),
    );
  }
}
