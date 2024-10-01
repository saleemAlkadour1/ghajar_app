import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.sort,
    required this.title,
    required this.pathImage,
  });
  final int sort;
  final String title;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.value(11).h),
      padding: EdgeInsets.symmetric(
          vertical: AppSpacing.value(12).h, horizontal: AppSpacing.value(12).w),
      height: AppSpacing.value(100).h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.regular.v),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.bg,
                radius: 20.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 15.r,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      sort.toString(),
                      style: MyText.appStyle.xl.wBold.reColorPrimary.style,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: MyText.appStyle.ll.wBold.reColorPrimary.style,
              )
            ],
          ),
          AppSpacing.value(16).inRow,
          Container(
            width: AppSpacing.value(119).w,
            height: AppSpacing.value(76).h,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(AppRadius.xs.v),
            ),
            child: Image.asset(pathImage),
          )
        ],
      ),
    );
  }
}
