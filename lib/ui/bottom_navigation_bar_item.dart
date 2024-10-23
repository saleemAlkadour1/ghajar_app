import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

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
              horizontal: width(4),
              vertical: height(8),
            ),
            margin: selectedIndex == 0
                ? EdgeInsets.only(left: width(8))
                : selectedIndex == 3
                    ? EdgeInsets.only(right: width(8))
                    : null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: MyText.appStyle.xs.wMedium.reColorPrimary.style,
                ),
                SizedBox(
                  width: width(6),
                ),
                SvgPicture.asset(
                  pathImage,
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary, BlendMode.srcIn),
                  width: width(22),
                  height: height(22),
                )
              ],
            ),
          )
        : Container(
            padding:
                EdgeInsets.symmetric(horizontal: width(8), vertical: height(8)),
            child: SvgPicture.asset(
              pathImage,
              width: width(24),
              height: height(24),
            ),
          ),
    label: '',
  );
}
