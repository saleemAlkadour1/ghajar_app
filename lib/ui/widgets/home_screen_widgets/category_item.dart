import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.pathImage,
  });
  final String title;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.regular.v)),
      padding: EdgeInsets.symmetric(horizontal: width(8), vertical: height(12)),
      margin: EdgeInsets.symmetric(
        horizontal: width(8),
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              title,
              style: MyText.appStyle.l.wMedium.reColorText.style,
            ),
            SizedBox(
              width: width(5),
            ),
            Container(
              width: width(42),
              height: height(32),
              decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(AppRadius.sm.v)),
              padding: EdgeInsets.symmetric(
                  horizontal: width(4), vertical: height(4)),
              child: Image.asset(
                pathImage,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
