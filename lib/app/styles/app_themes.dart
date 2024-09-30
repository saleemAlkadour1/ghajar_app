import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

import 'input_decoration_themes.dart';

class AppThemes {
  static const double _buttonHeight = 56;
  static const double _buttonWidth = 56;

  static ThemeData get main {
    return ThemeData(
      useMaterial3: false,
      fontFamily: MyText.fontFamily,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.bg,
      primarySwatch: AppColors.getMaterialColorFromColor(AppColors.primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
              // Todo(suheyl): [2024-08-26 - 9_36_a_m_] Update Styles
              // bodySmall: McApp.textStylesBodySm,
              // bodyMedium: McApp.textStylesBody,
              // bodyLarge: McApp.textStylesBodyLg,
              // titleSmall: McApp.textStylesButton,
              // titleMedium: McApp.textStylesButtonMd,
              // titleLarge: McApp.textStylesButtonLg,
              // displayLarge: McApp.textStylesBodyLg,
              // displayMedium: McApp.textStylesBody,
              // displaySmall: McApp.textStylesBodyLg,
              // labelLarge: McApp.textStylesButtonLg,
              // labelMedium: McApp.textStylesButtonMd,
              // labelSmall: McApp.textStylesButton,
              // headlineLarge: McApp.textStylesButtonLg,
              // headlineMedium: McApp.textStylesButtonMd,
              // headlineSmall: McApp.textStylesButton,
              )
          .apply(fontSizeFactor: 1.sp),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg.v).w,
        ),
        contentTextStyle: MyText.body.style,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.xxl.v).w,
            topRight: Radius.circular(AppRadius.xxl.v).w,
          ),
        ),
      ),
      dividerColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        elevation: 4,
        shadowColor: AppColors.black.withOpacity(.3),
        titleTextStyle: MyText.h3.style,
        actionsIconTheme: const IconThemeData(color: AppColors.text, size: 16),
        iconTheme: const IconThemeData(color: AppColors.text, size: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.xs.v),
          ),
          elevation: 0,
          minimumSize: const Size.fromHeight(_buttonHeight),
          fixedSize: const Size.fromHeight(_buttonWidth),
          shadowColor: Colors.transparent,
          textStyle: MyText.btn.style,
        ),
      ),
      inputDecorationTheme: InputDecorationThemes.main,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
