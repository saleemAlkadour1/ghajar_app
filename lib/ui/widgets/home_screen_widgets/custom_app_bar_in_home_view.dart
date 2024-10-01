import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';

class CustomAppBarInHomeView extends StatelessWidget {
  const CustomAppBarInHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/images/app_icons/cart.svg',
            width: 32.w,
            height: 36.h,
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
      ),
    );
  }
}
