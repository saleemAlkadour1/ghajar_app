import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/assets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: MyStrings.searchForSomething,
          hintStyle: MyText.appStyle.small.wRegular.reColorXXLightText.style,
          prefixIcon: SvgPicture.asset(
            Assets.images.app_icons.search_svg,
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
    ),
  );
}
