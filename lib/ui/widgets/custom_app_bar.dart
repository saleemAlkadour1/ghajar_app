import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

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
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.value(23).w),
      child: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: onTap,
          child: Container(
            width: AppSpacing.value(52).w,
            height: AppSpacing.value(52).h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppRadius.regular.v),
            ),
            child: Center(
              child: SvgPicture.asset('assets/images/app_icons/arrow_back.svg'),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
