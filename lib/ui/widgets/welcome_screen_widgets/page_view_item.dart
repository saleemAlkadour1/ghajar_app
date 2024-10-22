import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.details,
    required this.pathImage,
    required this.heightScreen,
    required this.widthScreen,
  });
  final String title;
  final String details;
  final String pathImage;
  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 21),
          child: SvgPicture.asset(
            pathImage,
            width: widthScreen,
            height: heightScreen * 0.3,
          ),
        ),
        AppSpacing.customHeight(heightScreen * 0.1),
        Text(
          title,
          style: MyText.appStyle.xl.wBold.reColorText.style,
        ),
        AppSpacing.customHeight(heightScreen * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(7.0).w),
          child: Text(
            details,
            style: MyText.appStyle.small.wMedium.reColorText.style,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
