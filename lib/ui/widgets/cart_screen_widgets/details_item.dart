import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_text_styles.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem(
      {super.key,
      required this.title,
      required this.value,
      this.styleTitle,
      this.styleValue});
  final String title;
  final String value;
  final TextStyle? styleTitle;
  final TextStyle? styleValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style:
              styleValue ?? MyText.appStyle.m.wRegular.reColorXXLightText.style,
        ),
        Text(
          title,
          style:
              styleTitle ?? MyText.appStyle.m.wRegular.reColorXXLightText.style,
        ),
      ],
    );
  }
}
