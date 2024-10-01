import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghajar_app/app/app_colors.dart';

class PriceCard extends StatelessWidget {
  const PriceCard(
      {super.key,
      required this.isDiscount,
      required this.price,
      this.oldPrice});
  final bool isDiscount;
  final double price;
  final double? oldPrice;

  @override
  Widget build(BuildContext context) {
    return isDiscount
        ? Row(
            children: [
              Text(
                '$oldPrice ',
                style: TextStyle(
                    color: AppColors.xXLightText,
                    fontSize: 16.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.primary),
              ),
              Text(
                price.toString(),
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                ),
              ),
            ],
          )
        : Text(
            price.toString(),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 20.sp,
            ),
          );
  }
}
