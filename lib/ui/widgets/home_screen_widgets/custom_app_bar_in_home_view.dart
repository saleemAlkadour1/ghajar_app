import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/assets.dart';

class CustomAppBarInHomeView extends StatelessWidget {
  const CustomAppBarInHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.xs.v)),
          padding: EdgeInsets.symmetric(
              vertical: AppSpacing.value(2).h,
              horizontal: AppSpacing.value(10).w),
          child: Image.asset(
            Assets.images.app_icons.logo_png,
            width: 32.w,
            height: 36.h,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              MyStrings.welcome,
              style: MyText.appStyle.xl.wBold.reColorPrimary.style,
            ),
            AppSpacing.value(6).inColumn,
            Text(
              MyStrings.ghajarCompany,
              style: MyText.appStyle.l.wMedium.reColorXLightText.style,
            ),
          ],
        )
      ],
    );
  }
}
