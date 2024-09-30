import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_spacing.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class TextsPageViewItem extends StatelessWidget {
  const TextsPageViewItem({
    super.key,
    required this.title,
    required this.details,
  });
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: MyText.appStyle.xl.wBold.reColorText.style,
        ),
        AppSpacing.value(18).inColumn,
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
