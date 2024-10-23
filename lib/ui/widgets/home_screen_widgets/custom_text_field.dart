import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/app/my_strings.dart';
import 'package:ghajar_app/assets.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

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
            height: height(23),
            width: width(23),
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: height(23),
            maxHeight: height(23),
            minWidth: width(23),
            maxWidth: width(23),
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
    ),
  );
}
