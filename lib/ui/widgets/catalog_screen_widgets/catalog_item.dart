import 'package:flutter/material.dart';
import 'package:ghajar_app/app/app_colors.dart';
import 'package:ghajar_app/app/app_radius.dart';
import 'package:ghajar_app/app/app_text_styles.dart';
import 'package:ghajar_app/utils/calculate_dimensions.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.sort,
    required this.title,
    required this.pathImage,
    required this.heightScreen,
    required this.widthScreen,
  });
  final int sort;
  final String title;
  final String pathImage;
  final double heightScreen;
  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: height(11),
      ),
      padding: EdgeInsets.all(
        emp(12),
      ),
      width: widthScreen,
      height: height(100),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.regular.v),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.bg,
                radius: emp(20),
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: emp(15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      sort.toString(),
                      style: MyText.appStyle
                          .customSize(adjustTextSize(sort.toString(), 24, 1))
                          .wBold
                          .reColorPrimary
                          .style,
                      softWrap: true,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: MyText.appStyle.ll.wBold.reColorPrimary.style,
              )
            ],
          ),
          SizedBox(
            width: width(24),
          ),
          Container(
            width: width(119),
            height: height(76),
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(AppRadius.xs.v),
            ),
            child: Image.asset(
              pathImage,
              width: width(104),
              height: height(61),
            ),
          )
        ],
      ),
    );
  }
}
