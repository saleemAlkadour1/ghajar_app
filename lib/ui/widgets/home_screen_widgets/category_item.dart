import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.pathImage,
  });
  final String title;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.regular.v)),
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Center(
        child: Row(
          children: [
            Text(
              title,
              style: MyText.appStyle.l.wMedium.reColorText.style,
            ),
            AppSpacing.value(5).inRow,
            Container(
                decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(AppRadius.sm.v)),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.value(4).w,
                    vertical: AppSpacing.value(4).h),
                child: Image.asset(pathImage))
          ],
        ),
      ),
    );
  }
}
