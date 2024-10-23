import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

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
          width: width(49),
          height: height(40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.xs.v)),
          padding: EdgeInsets.symmetric(
            vertical: height(2),
            horizontal: width(10),
          ),
          child: Image.asset(
            Assets.images.app_icons.logo_png,
            width: width(32),
            height: height(36),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              MyStrings.welcome,
              style: MyText.appStyle.xl.wBold.reColorPrimary.style,
            ),
            SizedBox(
              height: height(2),
            ),
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
