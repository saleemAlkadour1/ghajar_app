import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/utils/enums/font_weight_enum.dart';

import 'app_colors.dart';

const TextStyle _baseStyle = TextStyle(
  fontFamily: MyText._fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: AppColors.text,
  height: 1,
  backgroundColor: null,
);

class MyText {
  static const String _fontFamily = 'Tajawal';
  static const double _bodyFontSize = 16;
  final TextStyle _style;

  TextStyle get style =>
      _style.copyWith(fontSize: (_style.fontSize ?? _bodyFontSize).sp);

  static String get fontFamily => _fontFamily;

  const MyText._(this._style);

  //region Text size variations ( Typography ). //Not used here
  static MyText h1 = const MyText._(_baseStyle).wBold.xxxxl;
  static MyText h2 = const MyText._(_baseStyle).wBold.xxl;
  static MyText h3 = const MyText._(_baseStyle).wSemiBold.xl;
  static MyText h4 = const MyText._(_baseStyle).wBold.ll;
  static MyText h5 = const MyText._(_baseStyle).wSemiBold.l;
  static MyText h6 = const MyText._(_baseStyle).wSemiBold.m;
  static MyText body = const MyText._(_baseStyle).wLight.m;
  static MyText subtitle = const MyText._(_baseStyle).wRegular.xs;
  static MyText btn = const MyText._(_baseStyle).wBold.m;
  static MyText textBtn = const MyText._(_baseStyle).wBold.xs;
  static MyText appStyle = const MyText._(_baseStyle); //This is Used

  //Opacity

  MyText withOpacity(double opacityValue) {
    return MyText._(
      _style.copyWith(
        color: _style.color!.withOpacity(opacityValue),
      ),
    );
  }

  //endregion

  //region Font weight variations
  MyText get wThin =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.thin.weight));

  MyText get wThinItalic =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.thinItalic.weight));

  MyText get wExtraLight =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.extraLight.weight));

  MyText get wExtraLightItalic => MyText._(
      _style.copyWith(fontWeight: FontWeightEnum.extraLightItalic.weight));

  MyText get wLight =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.light.weight));

  MyText get wLightItalic =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.lightItalic.weight));

  MyText get wRegular =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.regular.weight));

  MyText get wRegularItalic => MyText._(
      _style.copyWith(fontWeight: FontWeightEnum.regularItalic.weight));

  MyText get wMedium =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.medium.weight));

  MyText get wMediumItalic =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.mediumItalic.weight));

  MyText get wSemiBold =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.semiBold.weight));

  MyText get wSemiBoldItalic => MyText._(
      _style.copyWith(fontWeight: FontWeightEnum.semiBoldItalic.weight));

  MyText get wBold =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.bold.weight));

  MyText get wBoldItalic =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.boldItalic.weight));

  MyText get wExtraBold =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.extraBold.weight));

  MyText get wExtraBoldItalic => MyText._(
      _style.copyWith(fontWeight: FontWeightEnum.extraBoldItalic.weight));

  MyText get wBlack =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.black.weight));

  MyText get wBlackItalic =>
      MyText._(_style.copyWith(fontWeight: FontWeightEnum.blackItalic.weight));

  //endregion

  //region Spacing variations

  //Application Defentions
  MyText get xl => MyText._(_style.copyWith(fontSize: 24));
  MyText get ll => MyText._(_style.copyWith(fontSize: 22));
  MyText get l => MyText._(_style.copyWith(fontSize: 20));
  MyText get ml => MyText._(_style.copyWith(fontSize: 18));
  MyText get m => MyText._(_style.copyWith(fontSize: 16));
  MyText get small => MyText._(_style.copyWith(fontSize: 14));
  MyText get xs => MyText._(_style.copyWith(fontSize: 12));
  MyText get xxs => MyText._(_style.copyWith(fontSize: 10));

  //General defenations

  // Extra Extra Large
  MyText get xxl => MyText._(_style.copyWith(fontSize: 33));

  // Triple Extra Large
  MyText get xxxl => MyText._(_style.copyWith(fontSize: 40));

  // Quadruple Extra Large
  MyText get xxxxl => MyText._(_style.copyWith(fontSize: 45));

  // Custom value
  MyText customSize(num value) =>
      MyText._(_style.copyWith(fontSize: value.toDouble()));

//endregion

  //region App colors

  //Application defenations

  MyText get reColorPrimary =>
      MyText._(_style.copyWith(color: AppColors.primary));
  MyText get reColorBg => MyText._(_style.copyWith(color: AppColors.bg));
  MyText get reColorText => MyText._(_style.copyWith(color: AppColors.text));
  MyText get reColorLightText =>
      MyText._(_style.copyWith(color: AppColors.lightText));
  MyText get reColorXLightText =>
      MyText._(_style.copyWith(color: AppColors.xlightText));
  MyText get reColorXXLightText =>
      MyText._(_style.copyWith(color: AppColors.xXLightText));
  MyText get reColorPageViewNav =>
      MyText._(_style.copyWith(color: AppColors.pageViewNav));
  MyText get reColorWhite => MyText._(_style.copyWith(color: AppColors.white));
  MyText get reColorBlack => MyText._(_style.copyWith(color: AppColors.black));
  MyText get reColorLightBlack =>
      MyText._(_style.copyWith(color: AppColors.lightBlack));
  MyText get reColorTitleNavigationBottom =>
      MyText._(_style.copyWith(color: AppColors.titleNavigationBottom));
  MyText get reColorRating =>
      MyText._(_style.copyWith(color: AppColors.rating));
  MyText get reColorPriceDetails =>
      MyText._(_style.copyWith(color: AppColors.priceDetails));
  MyText get reColorDescription =>
      MyText._(_style.copyWith(color: AppColors.description));

  //General defenations
  MyText get reColorPrimaryLight =>
      MyText._(_style.copyWith(color: AppColors.primaryLight));

  MyText get reColorWarning =>
      MyText._(_style.copyWith(color: AppColors.warning));

  MyText get reColorRed => MyText._(_style.copyWith(color: AppColors.red));

  MyText get reColorBorder =>
      MyText._(_style.copyWith(color: AppColors.border));

  MyText reColorIf(bool condition, Color color) =>
      MyText._(_style.copyWith(color: condition ? color : null));

//endregion

  MyText customLetterSpacing(num value) =>
      MyText._(_style.copyWith(letterSpacing: value.toDouble()));

  MyText customHeight(num value) =>
      MyText._(_style.copyWith(height: value.toDouble()));
}
