import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

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
              MyStrings.underfloorHeating,
              style: MyText.appStyle.l.wMedium.reColorText.style,
            ),
            AppSpacing.value(5).inRow,
            SvgPicture.asset('assets/images/app_icons/cart.svg')
          ],
        ),
      ),
    );
  }
}
