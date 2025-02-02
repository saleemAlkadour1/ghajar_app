import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/assets.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onTap,
    this.title,
    this.actions,
  });
  final void Function()? onTap;
  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(23)),
      child: SizedBox(
        height: height(90),
        child: AppBar(
          leadingWidth: width(52),
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.regular.v),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.app_icons.arrow_back_svg,
                  width: width(24),
                  height: height(24),
                ),
              ),
            ),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title ?? '',
              style: MyText.appStyle.xl.wBold.reColorPrimary.style,
            ),
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
