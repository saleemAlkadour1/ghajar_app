import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/translations.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          decoration: InputDecoration(
            hintText: Translations.searchForSomething,
            hintStyle: MyText.appStyle.small.wRegular.reColorXXLightText.style,
            prefixIcon: SvgPicture.asset(
              'assets/images/app_icons/search.svg',
              height: AppSpacing.value(23).h,
              width: AppSpacing.value(23).w,
            ),
            prefixIconConstraints: const BoxConstraints(
                minHeight: 23, maxHeight: 23, minWidth: 23, maxWidth: 23),
            fillColor: AppColors.white,
            filled: true,
            border: customOutLineBorder(),
            enabledBorder: customOutLineBorder(),
            focusedBorder: customOutLineBorder(),
            disabledBorder: customOutLineBorder(),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder customOutLineBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.regular.v,
      ),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ));
}
