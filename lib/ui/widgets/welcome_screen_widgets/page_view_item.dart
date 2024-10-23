import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.details,
    required this.pathImage,
  });
  final String title;
  final String details;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height(114),
        ),
        SvgPicture.asset(
          pathImage,
          width: widthScreen,
          height: height(261),
        ),
        SizedBox(
          height: height(80.32),
        ),
        Text(
          title,
          style: MyText.appStyle.xl.wBold.reColorText.style,
        ),
        SizedBox(
          height: height(18),
        ),
        Text(
          details,
          style: MyText.appStyle.small.wMedium.reColorText.style,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height(133),
        )
      ],
    );
  }
}
