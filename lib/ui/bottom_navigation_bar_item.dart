import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

BottomNavigationBarItem customBottomNavigationBarItem({
  required int index,
  required int selectedIndex,
  required String pathImage,
  required String title,
}) {
  return BottomNavigationBarItem(
    icon: selectedIndex == index
        ? Container(
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.37),
                borderRadius: BorderRadius.circular(AppRadius.superLg.v)),
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.value(4).w,
                vertical: AppSpacing.value(8).h),
            margin: selectedIndex == 0
                ? EdgeInsets.only(left: AppSpacing.value(8).w)
                : selectedIndex == 3
                    ? EdgeInsets.only(right: AppSpacing.value(8).w)
                    : null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: MyText.appStyle.xs.wMedium.reColorPrimary.style,
                ),
                AppSpacing.value(6).inRow,
                SvgPicture.asset(
                  pathImage,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                  width: 22.sp,
                  height: 22.sp,
                )
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.value(8).w,
                vertical: AppSpacing.value(8).h),
            child: SvgPicture.asset(
              pathImage,
              width: 24.sp,
              height: 24.sp,
            ),
          ),
    label: '',
  );
}
