import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: TextField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: MyStrings.searchForSomething,
          hintStyle: MyText.appStyle.small.wRegular.reColorXXLightText.style,
          suffixIcon: SvgPicture.asset(
            'assets/images/app_icons/search.svg',
            width: 15.sp,
            height: 15.sp,
          ),
          fillColor: AppColors.white,
          filled: true,
          border: customOutLineBorder(),
          enabledBorder: customOutLineBorder(),
          focusedBorder: customOutLineBorder(),
          disabledBorder: customOutLineBorder(),
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
